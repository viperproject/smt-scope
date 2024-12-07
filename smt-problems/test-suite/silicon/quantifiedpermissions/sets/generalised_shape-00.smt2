(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:26
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr
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
(declare-sort $FVF<g> 0)
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
(declare-fun $SortWrappers.$FVF<g>To$Snap ($FVF<g>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<g> ($Snap) $FVF<g>)
(assert (forall ((x $FVF<g>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<g>($SortWrappers.$FVF<g>To$Snap x)))
    :pattern (($SortWrappers.$FVF<g>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<g>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<g>To$Snap($SortWrappers.$SnapTo$FVF<g> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<g> x))
    :qid |$Snap.$FVF<g>To$SnapTo$FVF<g>|
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
; /field_value_functions_declarations.smt2 [g: Ref]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) $Ref)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g ($Ref $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap Set<$Ref> Set<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [g: Ref]
(assert (forall ((vs $FVF<g>) (ws $FVF<g>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_g vs) ($FVF.domain_g ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_g vs))
            (= ($FVF.lookup_g vs x) ($FVF.lookup_g ws x)))
          :pattern (($FVF.lookup_g vs x) ($FVF.lookup_g ws x))
          :qid |qp.$FVF<g>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<g>To$Snap vs)
              ($SortWrappers.$FVF<g>To$Snap ws)
              )
    :qid |qp.$FVF<g>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_g pm r))
    :pattern (($FVF.perm_g pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_g f r) true)
    :pattern (($FVF.loc_g f r)))))
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
; ---------- test05 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const ys@1@01 Set<$Ref>)
(declare-const x1@2@01 $Ref)
(declare-const x2@3@01 $Ref)
(declare-const xs@4@01 Set<$Ref>)
(declare-const ys@5@01 Set<$Ref>)
(declare-const x1@6@01 $Ref)
(declare-const x2@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const x@8@01 $Ref)
(push) ; 2
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 3
; [then-branch: 0 | !(x@8@01 in xs@4@01) | live]
; [else-branch: 0 | x@8@01 in xs@4@01 | live]
(push) ; 4
; [then-branch: 0 | !(x@8@01 in xs@4@01)]
(assert (not (Set_in x@8@01 xs@4@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@8@01 in xs@4@01]
(assert (Set_in x@8@01 xs@4@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@8@01 xs@4@01) (not (Set_in x@8@01 xs@4@01))))
(assert (and (Set_in x@8@01 xs@4@01) (not (Set_in x@8@01 ys@5@01))))
(pop) ; 2
(declare-const $t@9@01 $FVF<f>)
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (and (Set_in x@8@01 xs@4@01) (not (Set_in x@8@01 ys@5@01)))
    (or (Set_in x@8@01 xs@4@01) (not (Set_in x@8@01 xs@4@01))))
  :pattern ((Set_in x@8@01 xs@4@01))
  :pattern ((Set_in x@8@01 ys@5@01))
  :pattern ((inv@10@01 x@8@01))
  :pattern ((img@11@01 x@8@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@8@01 $Ref) (x2@8@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@8@01 xs@4@01) (not (Set_in x1@8@01 ys@5@01)))
      (and (Set_in x2@8@01 xs@4@01) (not (Set_in x2@8@01 ys@5@01)))
      (= x1@8@01 x2@8@01))
    (= x1@8@01 x2@8@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (and (Set_in x@8@01 xs@4@01) (not (Set_in x@8@01 ys@5@01)))
    (and (= (inv@10@01 x@8@01) x@8@01) (img@11@01 x@8@01)))
  :pattern ((Set_in x@8@01 xs@4@01))
  :pattern ((Set_in x@8@01 ys@5@01))
  :pattern ((inv@10@01 x@8@01))
  :pattern ((img@11@01 x@8@01))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (Set_in (inv@10@01 r) xs@4@01) (not (Set_in (inv@10@01 r) ys@5@01))))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (and (Set_in x@8@01 xs@4@01) (not (Set_in x@8@01 ys@5@01)))
    (not (= x@8@01 $Ref.null)))
  :pattern ((Set_in x@8@01 xs@4@01))
  :pattern ((Set_in x@8@01 ys@5@01))
  :pattern ((inv@10@01 x@8@01))
  :pattern ((img@11@01 x@8@01))
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
; var a: Int
(declare-const a@12@01 Int)
; [exec]
; inhale (x1 in xs)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] (x1 in xs)
(assert (Set_in x1@6@01 xs@4@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (x2 in xs)
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] (x2 in xs)
(assert (Set_in x2@7@01 xs@4@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale !((x1 in ys))
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(assert (not (Set_in x1@6@01 ys@5@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x1 != null
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] x1 != null
(assert (not (= x1@6@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x2 != null
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] x2 != null
(assert (not (= x2@7@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x1.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@11@01 x1@6@01)
  (and
    (Set_in (inv@10@01 x1@6@01) xs@4@01)
    (not (Set_in (inv@10@01 x1@6@01) ys@5@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@18@01 Int)
(assert (= a@18@01 ($FVF.lookup_f $t@9@01 x1@6@01)))
; [exec]
; a := x2.f
(push) ; 3
(assert (not (and
  (img@11@01 x2@7@01)
  (and
    (Set_in (inv@10@01 x2@7@01) xs@4@01)
    (not (Set_in (inv@10@01 x2@7@01) ys@5@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@19@01 Set<$Ref>)
(declare-const y1@20@01 $Ref)
(declare-const xs@21@01 Set<$Ref>)
(declare-const y1@22@01 $Ref)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(declare-const x@24@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@24@01 xs@21@01))
(pop) ; 2
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@24@01 $Ref) (x2@24@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@24@01 xs@21@01)
      (Set_in x2@24@01 xs@21@01)
      (= x1@24@01 x2@24@01))
    (= x1@24@01 x2@24@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@24@01 $Ref)) (!
  (=>
    (Set_in x@24@01 xs@21@01)
    (and (= (inv@25@01 x@24@01) x@24@01) (img@26@01 x@24@01)))
  :pattern ((Set_in x@24@01 xs@21@01))
  :pattern ((inv@25@01 x@24@01))
  :pattern ((img@26@01 x@24@01))
  :qid |quant-u-10|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@24@01 $Ref)) (!
  (=> (Set_in x@24@01 xs@21@01) (not (= x@24@01 $Ref.null)))
  :pattern ((Set_in x@24@01 xs@21@01))
  :pattern ((inv@25@01 x@24@01))
  :pattern ((img@26@01 x@24@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(declare-const x@27@01 $Ref)
(push) ; 2
; [eval] (x in xs) && x.f != 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 1 | !(x@27@01 in xs@21@01) | live]
; [else-branch: 1 | x@27@01 in xs@21@01 | live]
(push) ; 4
; [then-branch: 1 | !(x@27@01 in xs@21@01)]
(assert (not (Set_in x@27@01 xs@21@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | x@27@01 in xs@21@01]
(assert (Set_in x@27@01 xs@21@01))
; [eval] x.f != 0
(push) ; 5
(assert (not (and (img@26@01 x@27@01) (Set_in (inv@25@01 x@27@01) xs@21@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@27@01 xs@21@01) (not (Set_in x@27@01 xs@21@01))))
(assert (and
  (Set_in x@27@01 xs@21@01)
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01)
      0))))
(pop) ; 2
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x@27@01 xs@21@01)
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01)
          0)))
    (or (Set_in x@27@01 xs@21@01) (not (Set_in x@27@01 xs@21@01))))
  :pattern ((Set_in x@27@01 xs@21@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@27@01 xs@21@01)
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x1@27@01)
            0)))
      (and
        (Set_in x2@27@01 xs@21@01)
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x2@27@01)
            0)))
      (= x1@27@01 x2@27@01))
    (= x1@27@01 x2@27@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x@27@01 xs@21@01)
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01)
          0)))
    (and (= (inv@28@01 x@27@01) x@27@01) (img@29@01 x@27@01)))
  :pattern ((Set_in x@27@01 xs@21@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and
        (Set_in (inv@28@01 r) xs@21@01)
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) (inv@28@01 r))
            0))))
    (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x@27@01 xs@21@01)
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01)
          0)))
    (not (= x@27@01 $Ref.null)))
  :pattern ((Set_in x@27@01 xs@21@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) x@27@01))
  :pattern ((inv@28@01 x@27@01))
  :pattern ((img@29@01 x@27@01))
  :qid |g-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (y1 in xs)
(assert (Set_in y1@22@01 xs@21@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@30@01 Int)
; [exec]
; var r: Ref
(declare-const r@31@01 $Ref)
; [exec]
; a := y1.f
(push) ; 3
(assert (not (and (img@26@01 y1@22@01) (Set_in (inv@25@01 y1@22@01) xs@21@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@32@01 Int)
(assert (=
  a@32@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) y1@22@01)))
; [exec]
; r := y1.g
(push) ; 3
(assert (not (and
  (img@29@01 y1@22@01)
  (and
    (Set_in (inv@28@01 y1@22@01) xs@21@01)
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@23@01)) (inv@28@01 y1@22@01))
        0))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test12 ----------
(declare-const x1@33@01 $Ref)
(declare-const x1@34@01 $Ref)
(push) ; 1
(declare-const $t@35@01 $Ref)
(declare-const sm@36@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_g (as sm@36@01  $FVF<g>) x1@34@01) $t@35@01))
(assert (not (= x1@34@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(declare-const x@38@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@38@01 (Set_singleton x1@34@01)))
(pop) ; 3
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@38@01 $Ref) (x2@38@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@38@01 (Set_singleton x1@34@01))
      (Set_in x2@38@01 (Set_singleton x1@34@01))
      (= x1@38@01 x2@38@01))
    (= x1@38@01 x2@38@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@38@01 $Ref)) (!
  (=>
    (Set_in x@38@01 (Set_singleton x1@34@01))
    (and (= (inv@39@01 x@38@01) x@38@01) (img@40@01 x@38@01)))
  :pattern ((Set_in x@38@01 (Set_singleton x1@34@01)))
  :pattern ((inv@39@01 x@38@01))
  :pattern ((img@40@01 x@38@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) (Set_singleton x1@34@01)))
    (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@38@01 $Ref)) (!
  (=> (Set_in x@38@01 (Set_singleton x1@34@01)) (not (= x@38@01 $Ref.null)))
  :pattern ((Set_in x@38@01 (Set_singleton x1@34@01)))
  :pattern ((inv@39@01 x@38@01))
  :pattern ((img@40@01 x@38@01))
  :qid |g-permImpliesNonNull|)))
(declare-const sm@41@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@41@01  $FVF<g>) x1@34@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.second $t@37@01))))
(pop) ; 2
(push) ; 2
(declare-const x@42@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@42@01 (Set_singleton x1@34@01)))
(pop) ; 3
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@42@01 $Ref) (x2@42@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@42@01 (Set_singleton x1@34@01))
      (Set_in x2@42@01 (Set_singleton x1@34@01))
      (= x1@42@01 x2@42@01))
    (= x1@42@01 x2@42@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@42@01 $Ref)) (!
  (=>
    (Set_in x@42@01 (Set_singleton x1@34@01))
    (and (= (inv@43@01 x@42@01) x@42@01) (img@44@01 x@42@01)))
  :pattern ((Set_in x@42@01 (Set_singleton x1@34@01)))
  :pattern ((inv@43@01 x@42@01))
  :pattern ((img@44@01 x@42@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) (Set_singleton x1@34@01)))
    (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@43@01 r) (Set_singleton x1@34@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    ($Perm.min (ite (= r x1@34@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@45@01 x1@34@01)) $Perm.No)))
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
      (Set_in (inv@43@01 r) (Set_singleton x1@34@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    (= (- $Perm.Write (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@46@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@34@01)
    (=
      ($FVF.lookup_g (as sm@46@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@36@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@46@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@36@01  $FVF<g>) r))
  :qid |qp.fvfValDef0|)))
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
  (=> (= r x1@34@01) false)
  
  :qid |quant-u-19|))))
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
  (=> (= r x1@34@01) false)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- test14 ----------
(declare-const x1@47@01 $Ref)
(declare-const x1@48@01 $Ref)
(push) ; 1
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 ($Snap.combine ($Snap.first $t@49@01) ($Snap.second $t@49@01))))
(declare-const sm@50@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@49@01))))
(assert (not (= x1@48@01 $Ref.null)))
(declare-const sm@51@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@51@01  $FVF<f>) ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@49@01))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01)
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01)
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01)
    ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
  (not (= ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(declare-const x@53@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@53@01 (Set_singleton x1@48@01)))
(pop) ; 3
(declare-fun inv@54@01 ($Ref) $Ref)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@53@01 $Ref) (x2@53@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@53@01 (Set_singleton x1@48@01))
      (Set_in x2@53@01 (Set_singleton x1@48@01))
      (= x1@53@01 x2@53@01))
    (= x1@53@01 x2@53@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@53@01 $Ref)) (!
  (=>
    (Set_in x@53@01 (Set_singleton x1@48@01))
    (and (= (inv@54@01 x@53@01) x@53@01) (img@55@01 x@53@01)))
  :pattern ((Set_in x@53@01 (Set_singleton x1@48@01)))
  :pattern ((inv@54@01 x@53@01))
  :pattern ((img@55@01 x@53@01))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@55@01 r) (Set_in (inv@54@01 r) (Set_singleton x1@48@01)))
    (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@53@01 $Ref)) (!
  (=> (Set_in x@53@01 (Set_singleton x1@48@01)) (not (= x@53@01 $Ref.null)))
  :pattern ((Set_in x@53@01 (Set_singleton x1@48@01)))
  :pattern ((inv@54@01 x@53@01))
  :pattern ((img@55@01 x@53@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@56@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@56@01 (Set_singleton x1@48@01)))
(push) ; 4
(assert (not (and (img@55@01 x@56@01) (Set_in (inv@54@01 x@56@01) (Set_singleton x1@48@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@57@01 ($Ref) $Ref)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@56@01 $Ref) (x2@56@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@56@01 (Set_singleton x1@48@01))
      (Set_in x2@56@01 (Set_singleton x1@48@01))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x1@56@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x2@56@01)))
    (= x1@56@01 x2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@56@01 $Ref)) (!
  (=>
    (Set_in x@56@01 (Set_singleton x1@48@01))
    (and
      (=
        (inv@57@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x@56@01))
        x@56@01)
      (img@58@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x@56@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x@56@01))
  :qid |quant-u-24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@58@01 r) (Set_in (inv@57@01 r) (Set_singleton x1@48@01)))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) (inv@57@01 r))
      r))
  :pattern ((inv@57@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@56@01 $Ref)) (!
  (=>
    (Set_in x@56@01 (Set_singleton x1@48@01))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x@56@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@52@01)) x@56@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@59@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@59@01 (Set_singleton x1@48@01)))
(pop) ; 3
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@59@01 $Ref) (x2@59@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@59@01 (Set_singleton x1@48@01))
      (Set_in x2@59@01 (Set_singleton x1@48@01))
      (= x1@59@01 x2@59@01))
    (= x1@59@01 x2@59@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@59@01 $Ref)) (!
  (=>
    (Set_in x@59@01 (Set_singleton x1@48@01))
    (and (= (inv@60@01 x@59@01) x@59@01) (img@61@01 x@59@01)))
  :pattern ((Set_in x@59@01 (Set_singleton x1@48@01)))
  :pattern ((inv@60@01 x@59@01))
  :pattern ((img@61@01 x@59@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@61@01 r) (Set_in (inv@60@01 r) (Set_singleton x1@48@01)))
    (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@60@01 r) (Set_singleton x1@48@01))
      (img@61@01 r)
      (= r (inv@60@01 r)))
    ($Perm.min (ite (= r x1@48@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@62@01 x1@48@01)) $Perm.No)))
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
      (Set_in (inv@60@01 r) (Set_singleton x1@48@01))
      (img@61@01 r)
      (= r (inv@60@01 r)))
    (= (- $Perm.Write (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@48@01)
    (=
      ($FVF.lookup_g (as sm@63@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@63@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@50@01  $FVF<g>) r))
  :qid |qp.fvfValDef1|)))
(declare-const x@64@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@64@01 (Set_singleton x1@48@01)))
(push) ; 4
(assert (not (= x@64@01 x1@48@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@64@01 $Ref) (x2@64@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@64@01 (Set_singleton x1@48@01))
      (Set_in x2@64@01 (Set_singleton x1@48@01))
      (=
        ($FVF.lookup_g (as sm@63@01  $FVF<g>) x1@64@01)
        ($FVF.lookup_g (as sm@63@01  $FVF<g>) x2@64@01)))
    (= x1@64@01 x2@64@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@64@01 $Ref)) (!
  (=>
    (Set_in x@64@01 (Set_singleton x1@48@01))
    (and
      (= (inv@65@01 ($FVF.lookup_g (as sm@63@01  $FVF<g>) x@64@01)) x@64@01)
      (img@66@01 ($FVF.lookup_g (as sm@63@01  $FVF<g>) x@64@01))))
  :pattern (($FVF.lookup_g (as sm@63@01  $FVF<g>) x@64@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) (Set_singleton x1@48@01)))
    (= ($FVF.lookup_g (as sm@63@01  $FVF<g>) (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@65@01 r) (Set_singleton x1@48@01))
      (img@66@01 r)
      (= r ($FVF.lookup_g (as sm@63@01  $FVF<g>) (inv@65@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
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
(assert (not (=
  (-
    (ite
      (=
        ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01)
        ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
      $Perm.Write
      $Perm.No)
    (pTaken@67@01 ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01)))
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
    (and
      (Set_in (inv@65@01 r) (Set_singleton x1@48@01))
      (img@66@01 r)
      (= r ($FVF.lookup_g (as sm@63@01  $FVF<g>) (inv@65@01 r))))
    (= (- $Perm.Write (pTaken@67@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@50@01  $FVF<g>) x1@48@01))
    (=
      ($FVF.lookup_f (as sm@68@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@68@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(pop) ; 2
(pop) ; 1
; ---------- test13 ----------
(declare-const x1@69@01 $Ref)
(declare-const x1@70@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 ($Snap.combine ($Snap.first $t@71@01) ($Snap.second $t@71@01))))
(assert (not (= x1@70@01 $Ref.null)))
(declare-const sm@72@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@72@01  $FVF<f>) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@71@01))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01)))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01))
      ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01)))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01))
    ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@71@01)) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const x@73@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1))
; [eval] Set(x1)
(assert (Set_in x@73@01 (Set_singleton x1@70@01)))
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const x1@74@01 $Ref)
(declare-const x2@75@01 $Ref)
(declare-const x1@76@01 $Ref)
(declare-const x2@77@01 $Ref)
(push) ; 1
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 ($Snap.combine ($Snap.first $t@78@01) ($Snap.second $t@78@01))))
(declare-const sm@79@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@78@01))))
(assert (not (= x1@76@01 $Ref.null)))
(assert (=
  ($Snap.second $t@78@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@78@01))
    ($Snap.second ($Snap.second $t@78@01)))))
(declare-const $k@80@01 $Perm)
(assert ($Perm.isReadVar $k@80@01))
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@81@01  $FVF<f>) ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@78@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01)
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01))
    $k@80@01
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01)
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01))
    $k@80@01
    $Perm.No)
  $Perm.Write))
(assert (=>
  (ite
    (=
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01)
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01))
    (< $Perm.No $k@80@01)
    false)
  (not (= ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@78@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@78@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
(declare-const sm@82@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@82@01  $FVF<g>) x2@77@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@78@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x2@77@01 x1@76@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x2@77@01 $Ref.null)))
(declare-const sm@83@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@76@01)
    (=
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@79@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@83@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@79@01  $FVF<g>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@77@01)
    (=
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@82@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@83@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@82@01  $FVF<g>) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@84@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@84@01  $FPM) r)
    (+
      (ite (= r x1@76@01) $Perm.Write $Perm.No)
      (ite (= r x2@77@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@84@01  $FPM) x2@77@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
(declare-const sm@86@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@86@01  $FVF<f>) ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01)
  ($FVF.lookup_g (as sm@79@01  $FVF<g>) x1@76@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01)
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01))
    $k@85@01
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01)
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01))
    $k@85@01
    $Perm.No)
  $Perm.Write))
(assert (=>
  (ite
    (=
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01)
      ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01))
    (< $Perm.No $k@85@01)
    false)
  (not (= ($FVF.lookup_g (as sm@83@01  $FVF<g>) x2@77@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@87@01 $Snap)
(assert (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01))))
(declare-const x@88@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
(declare-const $k@89@01 $Perm)
(assert ($Perm.isReadVar $k@89@01))
(pop) ; 3
(declare-fun inv@90@01 ($Ref) $Ref)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@89@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@88@01 $Ref)) (!
  (=>
    (Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
    (or (= $k@89@01 $Perm.No) (< $Perm.No $k@89@01)))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@88@01 $Ref) (x2@88@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
        (< $Perm.No $k@89@01))
      (and
        (Set_in x2@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
        (< $Perm.No $k@89@01))
      (= x1@88@01 x2@88@01))
    (= x1@88@01 x2@88@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@88@01 $Ref)) (!
  (=>
    (and
      (Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
      (< $Perm.No $k@89@01))
    (and (= (inv@90@01 x@88@01) x@88@01) (img@91@01 x@88@01)))
  :pattern ((Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
  :pattern ((inv@90@01 x@88@01))
  :pattern ((img@91@01 x@88@01))
  :qid |quant-u-34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and
        (Set_in (inv@90@01 r) (Set_unionone (Set_singleton x1@76@01) x2@77@01))
        (< $Perm.No $k@89@01)))
    (= (inv@90@01 r) r))
  :pattern ((inv@90@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@88@01 $Ref)) (!
  (<= $Perm.No $k@89@01)
  :pattern ((Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
  :pattern ((inv@90@01 x@88@01))
  :pattern ((img@91@01 x@88@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@88@01 $Ref)) (!
  (<= $k@89@01 $Perm.Write)
  :pattern ((Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
  :pattern ((inv@90@01 x@88@01))
  :pattern ((img@91@01 x@88@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@88@01 $Ref)) (!
  (=>
    (and
      (Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
      (< $Perm.No $k@89@01))
    (not (= x@88@01 $Ref.null)))
  :pattern ((Set_in x@88@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
  :pattern ((inv@90@01 x@88@01))
  :pattern ((img@91@01 x@88@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@92@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@92@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
(push) ; 4
(assert (not (ite
  (and
    (img@91@01 x@92@01)
    (Set_in (inv@90@01 x@92@01) (Set_unionone (Set_singleton x1@76@01) x2@77@01)))
  (< $Perm.No $k@89@01)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(pop) ; 3
(declare-fun inv@94@01 ($Ref) $Ref)
(declare-fun img@95@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@93@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@92@01 $Ref)) (!
  (=>
    (Set_in x@92@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
    (or (= $k@93@01 $Perm.No) (< $Perm.No $k@93@01)))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@92@01 $Ref) (x2@92@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@92@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
        (< $Perm.No $k@93@01))
      (and
        (Set_in x2@92@01 (Set_unionone (Set_singleton x1@76@01) x2@77@01))
        (< $Perm.No $k@93@01))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@87@01)) x1@92@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@87@01)) x2@92@01)))
    (= x1@92@01 x2@92@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test15 ----------
(declare-const x1@96@01 $Ref)
(declare-const x2@97@01 $Ref)
(declare-const x1@98@01 $Ref)
(declare-const x2@99@01 $Ref)
(push) ; 1
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 ($Snap.combine ($Snap.first $t@100@01) ($Snap.second $t@100@01))))
(declare-const sm@101@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@100@01))))
(assert (not (= x1@98@01 $Ref.null)))
(assert (=
  ($Snap.second $t@100@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@100@01))
    ($Snap.second ($Snap.second $t@100@01)))))
(declare-const sm@102@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@102@01  $FVF<f>) ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@100@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
    ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
  (not (= ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@100@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@100@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@100@01))))))
(declare-const sm@103@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@103@01  $FVF<g>) x2@99@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@100@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x2@99@01 x1@98@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x2@99@01 $Ref.null)))
(declare-const sm@104@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@98@01)
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@99@01)
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@105@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@105@01  $FPM) r)
    (+
      (ite (= r x1@98@01) $Perm.Write $Perm.No)
      (ite (= r x2@99@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@105@01  $FPM) x2@99@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@106@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@106@01  $FVF<f>) ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second $t@100@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
  ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
    (/ (to_real 2) (to_real 3))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
    ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
  (not (= ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 ($Snap.combine ($Snap.first $t@107@01) ($Snap.second $t@107@01))))
(declare-const x@108@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
(declare-const $k@109@01 $Perm)
(assert ($Perm.isReadVar $k@109@01))
(pop) ; 3
(declare-fun inv@110@01 ($Ref) $Ref)
(declare-fun img@111@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@109@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@108@01 $Ref)) (!
  (=>
    (Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
    (or (= $k@109@01 $Perm.No) (< $Perm.No $k@109@01)))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@108@01 $Ref) (x2@108@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@109@01))
      (and
        (Set_in x2@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@109@01))
      (= x1@108@01 x2@108@01))
    (= x1@108@01 x2@108@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (and
      (Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (< $Perm.No $k@109@01))
    (and (= (inv@110@01 x@108@01) x@108@01) (img@111@01 x@108@01)))
  :pattern ((Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  :pattern ((inv@110@01 x@108@01))
  :pattern ((img@111@01 x@108@01))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (and
        (Set_in (inv@110@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@109@01)))
    (= (inv@110@01 r) r))
  :pattern ((inv@110@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@108@01 $Ref)) (!
  (<= $Perm.No $k@109@01)
  :pattern ((Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  :pattern ((inv@110@01 x@108@01))
  :pattern ((img@111@01 x@108@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@108@01 $Ref)) (!
  (<= $k@109@01 $Perm.Write)
  :pattern ((Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  :pattern ((inv@110@01 x@108@01))
  :pattern ((img@111@01 x@108@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (and
      (Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (< $Perm.No $k@109@01))
    (not (= x@108@01 $Ref.null)))
  :pattern ((Set_in x@108@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  :pattern ((inv@110@01 x@108@01))
  :pattern ((img@111@01 x@108@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@107@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@107@01))
    ($Snap.second ($Snap.second $t@107@01)))))
(assert (= ($Snap.first ($Snap.second $t@107@01)) $Snap.unit))
; [eval] x1.g != x2.g
(push) ; 3
(assert (not (ite
  (and
    (img@111@01 x1@98@01)
    (Set_in (inv@110@01 x1@98@01) (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  (< $Perm.No $k@109@01)
  false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (ite
  (and
    (img@111@01 x2@99@01)
    (Set_in (inv@110@01 x2@99@01) (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  (< $Perm.No $k@109@01)
  false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x1@98@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x2@99@01))))
(declare-const x@112@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@112@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
(push) ; 4
(assert (not (ite
  (and
    (img@111@01 x@112@01)
    (Set_in (inv@110@01 x@112@01) (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  (< $Perm.No $k@109@01)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@113@01 $Perm)
(assert ($Perm.isReadVar $k@113@01))
(pop) ; 3
(declare-fun inv@114@01 ($Ref) $Ref)
(declare-fun img@115@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@113@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@112@01 $Ref)) (!
  (=>
    (Set_in x@112@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
    (or (= $k@113@01 $Perm.No) (< $Perm.No $k@113@01)))
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@112@01 $Ref) (x2@112@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@112@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@113@01))
      (and
        (Set_in x2@112@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@113@01))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x1@112@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x2@112@01)))
    (= x1@112@01 x2@112@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@112@01 $Ref)) (!
  (=>
    (and
      (Set_in x@112@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (< $Perm.No $k@113@01))
    (and
      (=
        (inv@114@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01))
        x@112@01)
      (img@115@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01))
  :qid |quant-u-39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@115@01 r)
      (and
        (Set_in (inv@114@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@113@01)))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) (inv@114@01 r))
      r))
  :pattern ((inv@114@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@112@01 $Ref)) (!
  (<= $Perm.No $k@113@01)
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@112@01 $Ref)) (!
  (<= $k@113@01 $Perm.Write)
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@112@01 $Ref)) (!
  (=>
    (and
      (Set_in x@112@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (< $Perm.No $k@113@01))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@107@01)) x@112@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const x@116@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@116@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
(declare-const $k@117@01 $Perm)
(assert ($Perm.isReadVar $k@117@01))
(pop) ; 3
(declare-fun inv@118@01 ($Ref) $Ref)
(declare-fun img@119@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@117@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@116@01 $Ref)) (!
  (=>
    (Set_in x@116@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
    (or (= $k@117@01 $Perm.No) (< $Perm.No $k@117@01)))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@116@01 $Ref) (x2@116@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@116@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@117@01))
      (and
        (Set_in x2@116@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@117@01))
      (= x1@116@01 x2@116@01))
    (= x1@116@01 x2@116@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@116@01 $Ref)) (!
  (=>
    (and
      (Set_in x@116@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (< $Perm.No $k@117@01))
    (and (= (inv@118@01 x@116@01) x@116@01) (img@119@01 x@116@01)))
  :pattern ((Set_in x@116@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
  :pattern ((inv@118@01 x@116@01))
  :pattern ((img@119@01 x@116@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@119@01 r)
      (and
        (Set_in (inv@118@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@117@01)))
    (= (inv@118@01 r) r))
  :pattern ((inv@118@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    ($Perm.min (ite (= r x1@98@01) $Perm.Write $Perm.No) $k@117@01)
    $Perm.No))
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    ($Perm.min
      (ite (= r x2@99@01) $Perm.Write $Perm.No)
      (- $k@117@01 (pTaken@120@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@117@01
(assert (<
  (ite
    (and
      (Set_in (inv@118@01 x1@98@01) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@119@01 x1@98@01)
      (= x1@98@01 (inv@118@01 x1@98@01)))
    $k@117@01
    $Perm.No)
  $Perm.Write))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    (= (- $k@117@01 (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@117@01
(assert (<
  (ite
    (and
      (Set_in (inv@118@01 x2@99@01) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@119@01 x2@99@01)
      (= x2@99@01 (inv@118@01 x2@99@01)))
    $k@117@01
    $Perm.No)
  $Perm.Write))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    (= (- (- $k@117@01 (pTaken@120@01 r)) (pTaken@121@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] x1.g != x2.g
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@98@01)
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@99@01)
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
    :qid |qp.fvfValDef7|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No (+ $Perm.Write (ite (= x1@98@01 x2@99@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@98@01)
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@99@01)
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
    :qid |qp.fvfValDef7|))))
(push) ; 3
(assert (not (< $Perm.No (+ (ite (= x2@99@01 x1@98@01) $Perm.Write $Perm.No) $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@104@01  $FVF<g>) x1@98@01)
    ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)))))
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
(assert (not (=
  ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
  ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x1@98@01 x2@99@01)))
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
    (ite
      (=
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)
    (ite
      (=
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
      (/ (to_real 2) (to_real 3))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
    ($FVF.lookup_g (as sm@103@01  $FVF<g>) x2@99@01)))))
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
    ($FVF.lookup_g (as sm@103@01  $FVF<g>) x2@99@01)
    ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)))))
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
    (=
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)))))))
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
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
    (=
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)))
  (not
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x1@98@01 x2@99@01)) (not (= x2@99@01 x1@98@01)))
  (and
    (not
      (=
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)))
    (not
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))))))
(declare-const sm@122@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@123@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@123@01  $FPM) r)
    (+
      (ite
        (= r ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (ite
        (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (<=
  ($FVF.perm_f (as pm@123@01  $FPM) ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
  $Perm.Write))
(assert (<=
  ($FVF.perm_f (as pm@123@01  $FPM) ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
  $Perm.Write))
; Definitional axioms for snapshot map values
(assert (<= ($FVF.perm_g (as pm@105@01  $FPM) x1@98@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@105@01  $FPM) x2@99@01) $Perm.Write))
; [eval] x1.g != x2.g
(declare-const sm@124@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@99@01)
    (=
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@98@01)
    (=
      ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
  :qid |qp.fvfValDef15|)))
(declare-const pm@125@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@125@01  $FPM) r)
    (+
      (ite (= r x2@99@01) $Perm.Write $Perm.No)
      (ite (= r x1@98@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@125@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_g (as pm@125@01  $FPM) x1@98@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x2@99@01)
      (=
        ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (=>
      (= r x1@98@01)
      (=
        ($FVF.lookup_g (as sm@124@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@124@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
    :qid |qp.fvfValDef15|))))
(push) ; 3
(assert (not (< $Perm.No (+ $Perm.Write (ite (= x2@99@01 x1@98@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@124@01  $FVF<g>) x1@98@01)
    ($FVF.lookup_g (as sm@124@01  $FVF<g>) x2@99@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g (as sm@124@01  $FVF<g>) x1@98@01)
    ($FVF.lookup_g (as sm@124@01  $FVF<g>) x2@99@01))))
(declare-const x@126@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@126@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01)))
(declare-const $k@127@01 $Perm)
(assert ($Perm.isReadVar $k@127@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@98@01)
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@99@01)
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
    :qid |qp.fvfValDef7|))))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite (= x@126@01 x1@98@01) $Perm.Write $Perm.No)
    (ite (= x@126@01 x2@99@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@128@01 ($Ref) $Ref)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@127@01))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@98@01)
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@101@01  $FVF<g>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@99@01)
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@103@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@103@01  $FVF<g>) r))
  :qid |qp.fvfValDef7|)))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@126@01 $Ref)) (!
  (=>
    (Set_in x@126@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
    (or (= $k@127@01 $Perm.No) (< $Perm.No $k@127@01)))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@126@01 $Ref) (x2@126@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@126@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@127@01))
      (and
        (Set_in x2@126@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@127@01))
      (=
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x1@126@01)
        ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@126@01)))
    (= x1@126@01 x2@126@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@126@01 $Ref)) (!
  (=>
    (and
      (Set_in x@126@01 (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (< $Perm.No $k@127@01))
    (and
      (= (inv@128@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x@126@01)) x@126@01)
      (img@129@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x@126@01))))
  :pattern (($FVF.lookup_g (as sm@104@01  $FVF<g>) x@126@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (and
        (Set_in (inv@128@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
        (< $Perm.No $k@127@01)))
    (= ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@128@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@129@01 r)
      (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      $k@127@01)
    $Perm.No))
(define-fun pTaken@131@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@128@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@129@01 r)
      (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 r))))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      (- $k@127@01 (pTaken@130@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@127@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
          ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
      ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
    (<
      (ite
        (and
          (Set_in (inv@128@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
          (img@129@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
          (=
            ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
            ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)))))
        $k@127@01
        $Perm.No)
      (/ (to_real 2) (to_real 3)))
    (<
      (ite
        (and
          (Set_in (inv@128@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
          (img@129@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
          (=
            ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)
            ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01)))))
        $k@127@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@128@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@129@01 r)
      (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 r))))
    (= (- $k@127@01 (pTaken@130@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Constrain original permissions $k@127@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
          ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
        (/ (to_real 2) (to_real 3))
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
      ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
    (<
      (ite
        (and
          (Set_in (inv@128@01 ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
          (img@129@01 ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
          (=
            ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
            ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)))))
        $k@127@01
        $Perm.No)
      (/ (to_real 2) (to_real 3)))
    (<
      (ite
        (and
          (Set_in (inv@128@01 ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
          (img@129@01 ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
          (=
            ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)
            ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01)))))
        $k@127@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@128@01 r) (Set_unionone (Set_singleton x1@98@01) x2@99@01))
      (img@129@01 r)
      (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) (inv@128@01 r))))
    (= (- (- $k@127@01 (pTaken@130@01 r)) (pTaken@131@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@104@01  $FVF<g>) x2@99@01))
    (=
      ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@101@01  $FVF<g>) x1@98@01))
    (=
      ($FVF.lookup_f (as sm@132@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@102@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@102@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const x1@133@01 $Ref)
(declare-const x2@134@01 $Ref)
(declare-const x3@135@01 $Ref)
(declare-const x4@136@01 $Ref)
(declare-const x5@137@01 $Ref)
(declare-const x6@138@01 $Ref)
(declare-const x1@139@01 $Ref)
(declare-const x2@140@01 $Ref)
(declare-const x3@141@01 $Ref)
(declare-const x4@142@01 $Ref)
(declare-const x5@143@01 $Ref)
(declare-const x6@144@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@145@01 $Snap)
(assert (= $t@145@01 ($Snap.combine ($Snap.first $t@145@01) ($Snap.second $t@145@01))))
(declare-const sm@146@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first $t@145@01))))
(assert (not (= x1@139@01 $Ref.null)))
(assert (=
  ($Snap.second $t@145@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@145@01))
    ($Snap.second ($Snap.second $t@145@01)))))
(declare-const sm@147@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@147@01  $FVF<f>) ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@145@01)))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
  (not (= ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@145@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@145@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))
(declare-const sm@148@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@148@01  $FVF<g>) x2@140@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@145@01))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x2@140@01 x1@139@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x2@140@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@145@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@145@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))
(declare-const sm@149@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@139@01)
    (=
      ($FVF.lookup_g (as sm@149@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@149@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@149@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@149@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef22|)))
(declare-const pm@150@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@150@01  $FPM) r)
    (+
      (ite (= r x1@139@01) $Perm.Write $Perm.No)
      (ite (= r x2@140@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@150@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@150@01  $FPM) x2@140@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@151@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@151@01  $FVF<f>) ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01)
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01)
      ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01)
      ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01)
    ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
  (not (= ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))
(declare-const sm@152@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@152@01  $FVF<g>) x3@141@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x3@141@01 x2@140@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x3@141@01 x1@139@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x3@141@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))
(declare-const sm@153@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@139@01)
    (=
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@153@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@153@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@141@01)
    (=
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@153@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
  :qid |qp.fvfValDef26|)))
(declare-const pm@154@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@154@01  $FPM) r)
    (+
      (+
        (ite (= r x1@139@01) $Perm.Write $Perm.No)
        (ite (= r x2@140@01) $Perm.Write $Perm.No))
      (ite (= r x3@141@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@154@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@154@01  $FPM) x3@141@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@155@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@155@01  $FVF<f>) ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01)
  ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01)
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01)
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01)
      ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01)
    ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
  (not (= ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))
(declare-const sm@156@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@156@01  $FVF<g>) x4@142@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x4@142@01 x3@141@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x4@142@01 x2@140@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x4@142@01 x1@139@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x4@142@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))))
(declare-const sm@157@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@139@01)
    (=
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@157@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@157@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@141@01)
    (=
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@157@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@142@01)
    (=
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@157@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :qid |qp.fvfValDef31|)))
(declare-const pm@158@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@158@01  $FPM) r)
    (+
      (+
        (+
          (ite (= r x1@139@01) $Perm.Write $Perm.No)
          (ite (= r x2@140@01) $Perm.Write $Perm.No))
        (ite (= r x3@141@01) $Perm.Write $Perm.No))
      (ite (= r x4@142@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@158@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@158@01  $FPM) x4@142@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@159@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@159@01  $FVF<f>) ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
  ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
  ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
      ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
    ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
  (not (= ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))))
(declare-const sm@160@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@160@01  $FVF<g>) x5@143@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x5@143@01 x4@142@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x5@143@01 x3@141@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x5@143@01 x2@140@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x5@143@01 x1@139@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x5@143@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))))))
(declare-const sm@161@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@139@01)
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@161@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@161@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@141@01)
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@161@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@142@01)
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@161@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@143@01)
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@160@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@161@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@160@01  $FVF<g>) r))
  :qid |qp.fvfValDef37|)))
(declare-const pm@162@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@162@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x1@139@01) $Perm.Write $Perm.No)
            (ite (= r x2@140@01) $Perm.Write $Perm.No))
          (ite (= r x3@141@01) $Perm.Write $Perm.No))
        (ite (= r x4@142@01) $Perm.Write $Perm.No))
      (ite (= r x5@143@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@162@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@162@01  $FPM) x5@143@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@163@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@163@01  $FVF<f>) ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
  ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
  ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
  ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
      ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
    ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
  (not (= ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))))))
(declare-const sm@164@01 $FVF<g>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_g (as sm@164@01  $FVF<g>) x6@144@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x6@144@01 x5@143@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x6@144@01 x4@142@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x6@144@01 x3@141@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x6@144@01 x2@140@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x6@144@01 x1@139@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= x6@144@01 $Ref.null)))
(declare-const sm@165@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x1@139@01)
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@141@01)
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@142@01)
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@143@01)
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@160@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@160@01  $FVF<g>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x6@144@01)
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@164@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@164@01  $FVF<g>) r))
  :qid |qp.fvfValDef44|)))
(declare-const pm@166@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@166@01  $FPM) r)
    (+
      (+
        (+
          (+
            (+
              (ite (= r x1@139@01) $Perm.Write $Perm.No)
              (ite (= r x2@140@01) $Perm.Write $Perm.No))
            (ite (= r x3@141@01) $Perm.Write $Perm.No))
          (ite (= r x4@142@01) $Perm.Write $Perm.No))
        (ite (= r x5@143@01) $Perm.Write $Perm.No))
      (ite (= r x6@144@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@166@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_g (as pm@166@01  $FPM) x6@144@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@167@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@167@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@145@01))))))))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
  (not (= ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01) $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; test10(x1, x6)
; Precomputing data for removing quantified permissions
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (= r x1@139@01)
    ($Perm.min (ite (= r x1@139@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@169@01 ((r $Ref)) $Perm
  (ite
    (= r x1@139@01)
    ($Perm.min
      (ite (= r x2@140@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@168@01 r)))
    $Perm.No))
(define-fun pTaken@170@01 ((r $Ref)) $Perm
  (ite
    (= r x1@139@01)
    ($Perm.min
      (ite (= r x3@141@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r)))
    $Perm.No))
(define-fun pTaken@171@01 ((r $Ref)) $Perm
  (ite
    (= r x1@139@01)
    ($Perm.min
      (ite (= r x4@142@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r))
        (pTaken@170@01 r)))
    $Perm.No))
(define-fun pTaken@172@01 ((r $Ref)) $Perm
  (ite
    (= r x1@139@01)
    ($Perm.min
      (ite (= r x5@143@01) $Perm.Write $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r))
          (pTaken@170@01 r))
        (pTaken@171@01 r)))
    $Perm.No))
(define-fun pTaken@173@01 ((r $Ref)) $Perm
  (ite
    (= r x1@139@01)
    ($Perm.min
      (ite (= r x6@144@01) $Perm.Write $Perm.No)
      (-
        (-
          (-
            (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r))
            (pTaken@170@01 r))
          (pTaken@171@01 r))
        (pTaken@172@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@168@01 x1@139@01)) $Perm.No)))
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
  (=> (= r x1@139@01) (= (- $Perm.Write (pTaken@168@01 r)) $Perm.No))
  
  :qid |quant-u-54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)))
(assert (=>
  (= x1@139@01 x2@140@01)
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@148@01  $FVF<g>) x1@139@01))))
(assert (=>
  (= x1@139@01 x3@141@01)
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@152@01  $FVF<g>) x1@139@01))))
(assert (=>
  (= x1@139@01 x4@142@01)
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@156@01  $FVF<g>) x1@139@01))))
(assert (=>
  (= x1@139@01 x5@143@01)
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@160@01  $FVF<g>) x1@139@01))))
(assert (=>
  (= x1@139@01 x6@144@01)
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@164@01  $FVF<g>) x1@139@01))))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@139@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
    :qid |qp.fvfValDef39|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@140@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
    :qid |qp.fvfValDef40|))
  (forall ((r $Ref)) (!
    (=>
      (= r x3@141@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
    :qid |qp.fvfValDef41|))
  (forall ((r $Ref)) (!
    (=>
      (= r x4@142@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
    :qid |qp.fvfValDef42|))
  (forall ((r $Ref)) (!
    (=>
      (= r x5@143@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@160@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@160@01  $FVF<g>) r))
    :qid |qp.fvfValDef43|))
  (forall ((r $Ref)) (!
    (=>
      (= r x6@144@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@164@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@164@01  $FVF<g>) r))
    :qid |qp.fvfValDef44|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (+ $Perm.Write (ite (= x1@139@01 x2@140@01) $Perm.Write $Perm.No))
          (ite (= x1@139@01 x3@141@01) $Perm.Write $Perm.No))
        (ite (= x1@139@01 x4@142@01) $Perm.Write $Perm.No))
      (ite (= x1@139@01 x5@143@01) $Perm.Write $Perm.No))
    (ite (= x1@139@01 x6@144@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@174@01 $Perm)
(assert ($Perm.isReadVar $k@174@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01)
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01)
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01)
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01)
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
  ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@175@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
        $Perm.Write
        $Perm.No)
      $k@174@01)
    $Perm.No))
(define-fun pTaken@176@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
        $Perm.Write
        $Perm.No)
      (- $k@174@01 (pTaken@175@01 r)))
    $Perm.No))
(define-fun pTaken@177@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
        $Perm.Write
        $Perm.No)
      (- (- $k@174@01 (pTaken@175@01 r)) (pTaken@176@01 r)))
    $Perm.No))
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
        $Perm.Write
        $Perm.No)
      (- (- (- $k@174@01 (pTaken@175@01 r)) (pTaken@176@01 r)) (pTaken@177@01 r)))
    $Perm.No))
(define-fun pTaken@179@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $k@174@01 (pTaken@175@01 r)) (pTaken@176@01 r))
          (pTaken@177@01 r))
        (pTaken@178@01 r)))
    $Perm.No))
(define-fun pTaken@180@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@174@01 (pTaken@175@01 r)) (pTaken@176@01 r))
            (pTaken@177@01 r))
          (pTaken@178@01 r))
        (pTaken@179@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@174@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
          ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
        $k@174@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01)
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
        $k@174@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    (= (- $k@174@01 (pTaken@175@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@181@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
  (=
    ($FVF.lookup_f (as sm@181@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($FVF.lookup_f (as sm@167@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
  (=
    ($FVF.lookup_f (as sm@181@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($FVF.lookup_f (as sm@163@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
  (=
    ($FVF.lookup_f (as sm@181@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($FVF.lookup_f (as sm@159@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
  (=
    ($FVF.lookup_f (as sm@181@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($FVF.lookup_f (as sm@155@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
  (=
    ($FVF.lookup_f (as sm@181@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($FVF.lookup_f (as sm@151@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)
    ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
  (=
    ($FVF.lookup_f (as sm@181@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01))
    ($FVF.lookup_f (as sm@147@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x1@139@01)))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@182@01 ((r $Ref)) $Perm
  (ite
    (= r x6@144@01)
    ($Perm.min (ite (= r x6@144@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@183@01 ((r $Ref)) $Perm
  (ite
    (= r x6@144@01)
    ($Perm.min
      (ite (= r x2@140@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@182@01 r)))
    $Perm.No))
(define-fun pTaken@184@01 ((r $Ref)) $Perm
  (ite
    (= r x6@144@01)
    ($Perm.min
      (ite (= r x3@141@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@182@01 r)) (pTaken@183@01 r)))
    $Perm.No))
(define-fun pTaken@185@01 ((r $Ref)) $Perm
  (ite
    (= r x6@144@01)
    ($Perm.min
      (ite (= r x4@142@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@182@01 r)) (pTaken@183@01 r))
        (pTaken@184@01 r)))
    $Perm.No))
(define-fun pTaken@186@01 ((r $Ref)) $Perm
  (ite
    (= r x6@144@01)
    ($Perm.min
      (ite (= r x5@143@01) $Perm.Write $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@182@01 r)) (pTaken@183@01 r))
          (pTaken@184@01 r))
        (pTaken@185@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@182@01 x6@144@01)) $Perm.No)))
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
  (=> (= r x6@144@01) (= (- $Perm.Write (pTaken@182@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@187@01 $FVF<g>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= x6@144@01 x2@140@01)
  (=
    ($FVF.lookup_g (as sm@187@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@148@01  $FVF<g>) x6@144@01))))
(assert (=>
  (= x6@144@01 x3@141@01)
  (=
    ($FVF.lookup_g (as sm@187@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@152@01  $FVF<g>) x6@144@01))))
(assert (=>
  (= x6@144@01 x4@142@01)
  (=
    ($FVF.lookup_g (as sm@187@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@156@01  $FVF<g>) x6@144@01))))
(assert (=>
  (= x6@144@01 x5@143@01)
  (=
    ($FVF.lookup_g (as sm@187@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@160@01  $FVF<g>) x6@144@01))))
(assert (=
  ($FVF.lookup_g (as sm@187@01  $FVF<g>) x6@144@01)
  ($FVF.lookup_g (as sm@164@01  $FVF<g>) x6@144@01)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x1@139@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@146@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@146@01  $FVF<g>) r))
    :qid |qp.fvfValDef39|))
  (forall ((r $Ref)) (!
    (=>
      (= r x2@140@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
    :qid |qp.fvfValDef40|))
  (forall ((r $Ref)) (!
    (=>
      (= r x3@141@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
    :qid |qp.fvfValDef41|))
  (forall ((r $Ref)) (!
    (=>
      (= r x4@142@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
    :qid |qp.fvfValDef42|))
  (forall ((r $Ref)) (!
    (=>
      (= r x5@143@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@160@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@160@01  $FVF<g>) r))
    :qid |qp.fvfValDef43|))
  (forall ((r $Ref)) (!
    (=>
      (= r x6@144@01)
      (=
        ($FVF.lookup_g (as sm@165@01  $FVF<g>) r)
        ($FVF.lookup_g (as sm@164@01  $FVF<g>) r)))
    :pattern (($FVF.lookup_g (as sm@165@01  $FVF<g>) r))
    :pattern (($FVF.lookup_g (as sm@164@01  $FVF<g>) r))
    :qid |qp.fvfValDef44|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (+
            (ite (= x6@144@01 x1@139@01) $Perm.Write $Perm.No)
            (ite (= x6@144@01 x2@140@01) $Perm.Write $Perm.No))
          (ite (= x6@144@01 x3@141@01) $Perm.Write $Perm.No))
        (ite (= x6@144@01 x4@142@01) $Perm.Write $Perm.No))
      (ite (= x6@144@01 x5@143@01) $Perm.Write $Perm.No))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@188@01 $Perm)
(assert ($Perm.isReadVar $k@188@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@189@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
        $Perm.Write
        $Perm.No)
      $k@188@01)
    $Perm.No))
(define-fun pTaken@190@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
        (- $Perm.Write (pTaken@175@01 r))
        $Perm.No)
      (- $k@188@01 (pTaken@189@01 r)))
    $Perm.No))
(define-fun pTaken@191@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
        $Perm.Write
        $Perm.No)
      (- (- $k@188@01 (pTaken@189@01 r)) (pTaken@190@01 r)))
    $Perm.No))
(define-fun pTaken@192@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
        $Perm.Write
        $Perm.No)
      (- (- (- $k@188@01 (pTaken@189@01 r)) (pTaken@190@01 r)) (pTaken@191@01 r)))
    $Perm.No))
(define-fun pTaken@193@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (- (- $k@188@01 (pTaken@189@01 r)) (pTaken@190@01 r))
          (pTaken@191@01 r))
        (pTaken@192@01 r)))
    $Perm.No))
(define-fun pTaken@194@01 ((r $Ref)) $Perm
  (ite
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($Perm.min
      (ite
        (= r ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
        $Perm.Write
        $Perm.No)
      (-
        (-
          (-
            (- (- $k@188@01 (pTaken@189@01 r)) (pTaken@190@01 r))
            (pTaken@191@01 r))
          (pTaken@192@01 r))
        (pTaken@193@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@188@01
(assert (=>
  (not
    (=
      (ite
        (=
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
        $Perm.Write
        $Perm.No)
      $Perm.No))
  (ite
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
        $k@188@01
        $Perm.No)
      $Perm.Write)
    (<
      (ite
        (=
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
          ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
        $k@188@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    (= (- $k@188@01 (pTaken@189@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@195@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (=
      ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
      ($FVF.lookup_g (as sm@146@01  $FVF<g>) x1@139@01))
    (<
      $Perm.No
      (-
        $Perm.Write
        (pTaken@175@01 ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))))
    false)
  (=
    ($FVF.lookup_f (as sm@195@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($FVF.lookup_f (as sm@147@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
  (=
    ($FVF.lookup_f (as sm@195@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($FVF.lookup_f (as sm@167@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@161@01  $FVF<g>) x5@143@01))
  (=
    ($FVF.lookup_f (as sm@195@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($FVF.lookup_f (as sm@163@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@157@01  $FVF<g>) x4@142@01))
  (=
    ($FVF.lookup_f (as sm@195@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($FVF.lookup_f (as sm@159@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@153@01  $FVF<g>) x3@141@01))
  (=
    ($FVF.lookup_f (as sm@195@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($FVF.lookup_f (as sm@155@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)))))
(assert (=>
  (=
    ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)
    ($FVF.lookup_g (as sm@149@01  $FVF<g>) x2@140@01))
  (=
    ($FVF.lookup_f (as sm@195@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01))
    ($FVF.lookup_f (as sm@151@01  $FVF<f>) ($FVF.lookup_g (as sm@165@01  $FVF<g>) x6@144@01)))))
(declare-const $t@196@01 $Snap)
(assert (= $t@196@01 ($Snap.combine ($Snap.first $t@196@01) ($Snap.second $t@196@01))))
(declare-const x@197@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
(declare-const $k@198@01 $Perm)
(assert ($Perm.isReadVar $k@198@01))
(pop) ; 3
(declare-fun inv@199@01 ($Ref) $Ref)
(declare-fun img@200@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@198@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@197@01 $Ref)) (!
  (=>
    (Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
    (or (= $k@198@01 $Perm.No) (< $Perm.No $k@198@01)))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@197@01 $Ref) (x2@197@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
        (< $Perm.No $k@198@01))
      (and
        (Set_in x2@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
        (< $Perm.No $k@198@01))
      (= x1@197@01 x2@197@01))
    (= x1@197@01 x2@197@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@197@01 $Ref)) (!
  (=>
    (and
      (Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
      (< $Perm.No $k@198@01))
    (and (= (inv@199@01 x@197@01) x@197@01) (img@200@01 x@197@01)))
  :pattern ((Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
  :pattern ((inv@199@01 x@197@01))
  :pattern ((img@200@01 x@197@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@200@01 r)
      (and
        (Set_in (inv@199@01 r) (Set_unionone (Set_singleton x1@139@01) x6@144@01))
        (< $Perm.No $k@198@01)))
    (= (inv@199@01 r) r))
  :pattern ((inv@199@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@197@01 $Ref)) (!
  (<= $Perm.No $k@198@01)
  :pattern ((Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
  :pattern ((inv@199@01 x@197@01))
  :pattern ((img@200@01 x@197@01))
  :qid |g-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((x@197@01 $Ref)) (!
  (<= $k@198@01 $Perm.Write)
  :pattern ((Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
  :pattern ((inv@199@01 x@197@01))
  :pattern ((img@200@01 x@197@01))
  :qid |g-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((x@197@01 $Ref)) (!
  (=>
    (and
      (Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
      (< $Perm.No $k@198@01))
    (not (= x@197@01 $Ref.null)))
  :pattern ((Set_in x@197@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
  :pattern ((inv@199@01 x@197@01))
  :pattern ((img@200@01 x@197@01))
  :qid |g-permImpliesNonNull|)))
(declare-const x@201@01 $Ref)
(push) ; 3
; [eval] (x in Set(x1, x2))
; [eval] Set(x1, x2)
(assert (Set_in x@201@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
(declare-const sm@202@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@141@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@142@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@143@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@160@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@160@01  $FVF<g>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@200@01 r)
        (Set_in (inv@199@01 r) (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
      (< $Perm.No $k@198@01)
      false)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@196@01)) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@196@01)) r))
  :qid |qp.fvfValDef69|)))
(declare-const pm@203@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@203@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x2@140@01) $Perm.Write $Perm.No)
            (ite (= r x3@141@01) $Perm.Write $Perm.No))
          (ite (= r x4@142@01) $Perm.Write $Perm.No))
        (ite (= r x5@143@01) $Perm.Write $Perm.No))
      (ite
        (and
          (img@200@01 r)
          (Set_in (inv@199@01 r) (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
        $k@198@01
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@203@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(push) ; 4
(assert (not (< $Perm.No ($FVF.perm_g (as pm@203@01  $FPM) x@201@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@204@01 $Perm)
(assert ($Perm.isReadVar $k@204@01))
(pop) ; 3
(declare-fun inv@205@01 ($Ref) $Ref)
(declare-fun img@206@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r x2@140@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@148@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@148@01  $FVF<g>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x3@141@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@152@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@152@01  $FVF<g>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x4@142@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@156@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@156@01  $FVF<g>) r))
  :qid |qp.fvfValDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x5@143@01)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@160@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@160@01  $FVF<g>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@200@01 r)
        (Set_in (inv@199@01 r) (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
      (< $Perm.No $k@198@01)
      false)
    (=
      ($FVF.lookup_g (as sm@202@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@196@01)) r)))
  :pattern (($FVF.lookup_g (as sm@202@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@196@01)) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@203@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x2@140@01) $Perm.Write $Perm.No)
            (ite (= r x3@141@01) $Perm.Write $Perm.No))
          (ite (= r x4@142@01) $Perm.Write $Perm.No))
        (ite (= r x5@143@01) $Perm.Write $Perm.No))
      (ite
        (and
          (img@200@01 r)
          (Set_in (inv@199@01 r) (Set_unionone (Set_singleton x1@139@01) x6@144@01)))
        $k@198@01
        $Perm.No)))
  :pattern (($FVF.perm_g (as pm@203@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert ($Perm.isReadVar $k@204@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((x@201@01 $Ref)) (!
  (=>
    (Set_in x@201@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
    (or (= $k@204@01 $Perm.No) (< $Perm.No $k@204@01)))
  
  :qid |quant-u-66|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@201@01 $Ref) (x2@201@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@201@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
        (< $Perm.No $k@204@01))
      (and
        (Set_in x2@201@01 (Set_unionone (Set_singleton x1@139@01) x6@144@01))
        (< $Perm.No $k@204@01))
      (=
        ($FVF.lookup_g (as sm@202@01  $FVF<g>) x1@201@01)
        ($FVF.lookup_g (as sm@202@01  $FVF<g>) x2@201@01)))
    (= x1@201@01 x2@201@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const xs@207@01 Set<$Ref>)
(declare-const y1@208@01 $Ref)
(declare-const y2@209@01 $Ref)
(declare-const y3@210@01 $Ref)
(declare-const xs@211@01 Set<$Ref>)
(declare-const y1@212@01 $Ref)
(declare-const y2@213@01 $Ref)
(declare-const y3@214@01 $Ref)
(push) ; 1
(declare-const $t@215@01 $Snap)
(assert (= $t@215@01 ($Snap.combine ($Snap.first $t@215@01) ($Snap.second $t@215@01))))
(declare-const x@216@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@216@01 xs@211@01))
(pop) ; 2
(declare-fun inv@217@01 ($Ref) $Ref)
(declare-fun img@218@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@216@01 $Ref) (x2@216@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@216@01 xs@211@01)
      (Set_in x2@216@01 xs@211@01)
      (= x1@216@01 x2@216@01))
    (= x1@216@01 x2@216@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@216@01 $Ref)) (!
  (=>
    (Set_in x@216@01 xs@211@01)
    (and (= (inv@217@01 x@216@01) x@216@01) (img@218@01 x@216@01)))
  :pattern ((Set_in x@216@01 xs@211@01))
  :pattern ((inv@217@01 x@216@01))
  :pattern ((img@218@01 x@216@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@218@01 r) (Set_in (inv@217@01 r) xs@211@01))
    (= (inv@217@01 r) r))
  :pattern ((inv@217@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@216@01 $Ref)) (!
  (=> (Set_in x@216@01 xs@211@01) (not (= x@216@01 $Ref.null)))
  :pattern ((Set_in x@216@01 xs@211@01))
  :pattern ((inv@217@01 x@216@01))
  :pattern ((img@218@01 x@216@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@215@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@215@01))
    ($Snap.second ($Snap.second $t@215@01)))))
(assert (= ($Snap.first ($Snap.second $t@215@01)) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } (x1 in xs) && ((x2 in xs) && x1 != x2) ==> x1.g != x2.g)
(declare-const x1@219@01 $Ref)
(declare-const x2@220@01 $Ref)
(push) ; 2
; [eval] (x1 in xs) && ((x2 in xs) && x1 != x2) ==> x1.g != x2.g
; [eval] (x1 in xs) && ((x2 in xs) && x1 != x2)
; [eval] (x1 in xs)
(push) ; 3
; [then-branch: 2 | !(x1@219@01 in xs@211@01) | live]
; [else-branch: 2 | x1@219@01 in xs@211@01 | live]
(push) ; 4
; [then-branch: 2 | !(x1@219@01 in xs@211@01)]
(assert (not (Set_in x1@219@01 xs@211@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | x1@219@01 in xs@211@01]
(assert (Set_in x1@219@01 xs@211@01))
; [eval] (x2 in xs)
(push) ; 5
; [then-branch: 3 | !(x2@220@01 in xs@211@01) | live]
; [else-branch: 3 | x2@220@01 in xs@211@01 | live]
(push) ; 6
; [then-branch: 3 | !(x2@220@01 in xs@211@01)]
(assert (not (Set_in x2@220@01 xs@211@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | x2@220@01 in xs@211@01]
(assert (Set_in x2@220@01 xs@211@01))
; [eval] x1 != x2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x2@220@01 xs@211@01) (not (Set_in x2@220@01 xs@211@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x1@219@01 xs@211@01)
  (and
    (Set_in x1@219@01 xs@211@01)
    (or (Set_in x2@220@01 xs@211@01) (not (Set_in x2@220@01 xs@211@01))))))
(assert (or (Set_in x1@219@01 xs@211@01) (not (Set_in x1@219@01 xs@211@01))))
(push) ; 3
; [then-branch: 4 | x1@219@01 in xs@211@01 && x2@220@01 in xs@211@01 && x1@219@01 != x2@220@01 | live]
; [else-branch: 4 | !(x1@219@01 in xs@211@01 && x2@220@01 in xs@211@01 && x1@219@01 != x2@220@01) | live]
(push) ; 4
; [then-branch: 4 | x1@219@01 in xs@211@01 && x2@220@01 in xs@211@01 && x1@219@01 != x2@220@01]
(assert (and
  (Set_in x1@219@01 xs@211@01)
  (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01)))))
; [eval] x1.g != x2.g
(push) ; 5
(assert (not (and (img@218@01 x1@219@01) (Set_in (inv@217@01 x1@219@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and (img@218@01 x2@220@01) (Set_in (inv@217@01 x2@220@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(x1@219@01 in xs@211@01 && x2@220@01 in xs@211@01 && x1@219@01 != x2@220@01)]
(assert (not
  (and
    (Set_in x1@219@01 xs@211@01)
    (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in x1@219@01 xs@211@01)
    (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01))))
  (and
    (Set_in x1@219@01 xs@211@01)
    (Set_in x2@220@01 xs@211@01)
    (not (= x1@219@01 x2@220@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x1@219@01 xs@211@01)
      (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01)))))
  (and
    (Set_in x1@219@01 xs@211@01)
    (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@219@01 $Ref) (x2@220@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@219@01 xs@211@01)
      (and
        (Set_in x1@219@01 xs@211@01)
        (or (Set_in x2@220@01 xs@211@01) (not (Set_in x2@220@01 xs@211@01)))))
    (or (Set_in x1@219@01 xs@211@01) (not (Set_in x1@219@01 xs@211@01)))
    (=>
      (and
        (Set_in x1@219@01 xs@211@01)
        (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01))))
      (and
        (Set_in x1@219@01 xs@211@01)
        (Set_in x2@220@01 xs@211@01)
        (not (= x1@219@01 x2@220@01))))
    (or
      (not
        (and
          (Set_in x1@219@01 xs@211@01)
          (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01)))))
      (and
        (Set_in x1@219@01 xs@211@01)
        (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01))))))
  :pattern ((Set_in x1@219@01 xs@211@01) (Set_in x2@220@01 xs@211@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@85@12@85@88-aux|)))
(assert (forall ((x1@219@01 $Ref) (x2@220@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@219@01 xs@211@01)
      (and (Set_in x2@220@01 xs@211@01) (not (= x1@219@01 x2@220@01))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x1@219@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x2@220@01))))
  :pattern ((Set_in x1@219@01 xs@211@01) (Set_in x2@220@01 xs@211@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@85@12@85@88|)))
(assert (=
  ($Snap.second ($Snap.second $t@215@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@215@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@215@01))))))
(declare-const x@221@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@221@01 xs@211@01))
(push) ; 3
(assert (not (and (img@218@01 x@221@01) (Set_in (inv@217@01 x@221@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@222@01 ($Ref) $Ref)
(declare-fun img@223@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@221@01 $Ref) (x2@221@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@221@01 xs@211@01)
      (Set_in x2@221@01 xs@211@01)
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x1@221@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x2@221@01)))
    (= x1@221@01 x2@221@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@221@01 $Ref)) (!
  (=>
    (Set_in x@221@01 xs@211@01)
    (and
      (=
        (inv@222@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x@221@01))
        x@221@01)
      (img@223@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x@221@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x@221@01))
  :qid |quant-u-70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@223@01 r) (Set_in (inv@222@01 r) xs@211@01))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) (inv@222@01 r))
      r))
  :pattern ((inv@222@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@221@01 $Ref)) (!
  (=>
    (Set_in x@221@01 xs@211@01)
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x@221@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) x@221@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@215@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@215@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@215@01))))
  $Snap.unit))
; [eval] (y1 in xs)
(assert (Set_in y1@212@01 xs@211@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01)))))
  $Snap.unit))
; [eval] (y2 in xs)
(assert (Set_in y2@213@01 xs@211@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01))))))
  $Snap.unit))
; [eval] (y3 in xs)
(assert (Set_in y3@214@01 xs@211@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@215@01))))))
  $Snap.unit))
; [eval] y1 != y2
(assert (not (= y1@212@01 y2@213@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@224@01 Int)
; [exec]
; inhale y1.g != null
(declare-const $t@225@01 $Snap)
(assert (= $t@225@01 $Snap.unit))
; [eval] y1.g != null
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
    $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale y2.g != null
(declare-const $t@226@01 $Snap)
(assert (= $t@226@01 $Snap.unit))
; [eval] y2.g != null
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@218@01 y2@213@01) (Set_in (inv@217@01 y2@213@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y2@213@01)
    $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; a := y1.g.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@223@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01))
  (Set_in (inv@222@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@227@01 Int)
(assert (=
  a@227@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@215@01)))) ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01))))
; [exec]
; assert y1.g != y2.g
; [eval] y1.g != y2.g
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and (img@218@01 y2@213@01) (Set_in (inv@217@01 y2@213@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y2@213@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y2@213@01))))
; [exec]
; assert y1.g != y3.g || y2.g != y3.g
; [eval] y1.g != y3.g || y2.g != y3.g
; [eval] y1.g != y3.g
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and (img@218@01 y3@214@01) (Set_in (inv@217@01 y3@214@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 5 | Lookup(g, First:($t@215@01), y1@212@01) != Lookup(g, First:($t@215@01), y3@214@01) | live]
; [else-branch: 5 | Lookup(g, First:($t@215@01), y1@212@01) == Lookup(g, First:($t@215@01), y3@214@01) | live]
(push) ; 4
; [then-branch: 5 | Lookup(g, First:($t@215@01), y1@212@01) != Lookup(g, First:($t@215@01), y3@214@01)]
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | Lookup(g, First:($t@215@01), y1@212@01) == Lookup(g, First:($t@215@01), y3@214@01)]
(assert (=
  ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
  ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01)))
; [eval] y2.g != y3.g
(push) ; 5
(assert (not (and (img@218@01 y2@213@01) (Set_in (inv@217@01 y2@213@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and (img@218@01 y3@214@01) (Set_in (inv@217@01 y3@214@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01))
  (not
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01)))))
(push) ; 3
(assert (not (or
  (not
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01)))
  (not
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y2@213@01)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or
  (not
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01)))
  (not
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y2@213@01)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01)))))
; [exec]
; assert y1.g != y3.g && y2.g != y3.g
; [eval] y1.g != y3.g
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and (img@218@01 y3@214@01) (Set_in (inv@217@01 y3@214@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y1@212@01)
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) y3@214@01)))))
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
(declare-const sm@228@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@223@01 r) (Set_in (inv@222@01 r) xs@211@01))
    (=
      ($FVF.lookup_f (as sm@228@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@215@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@228@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@215@01)))) r))
  :qid |qp.fvfValDef71|)))
(declare-const pm@229@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@229@01  $FPM) r)
    (ite
      (and (img@223@01 r) (Set_in (inv@222@01 r) xs@211@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@229@01  $FPM) r))
  :qid |qp.resPrmSumDef72|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@229@01  $FPM) r) $Perm.Write)
  :pattern ((inv@222@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@230@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@218@01 r) (Set_in (inv@217@01 r) xs@211@01))
    (=
      ($FVF.lookup_g (as sm@230@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) r)))
  :pattern (($FVF.lookup_g (as sm@230@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) r))
  :qid |qp.fvfValDef73|)))
(declare-const pm@231@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@231@01  $FPM) r)
    (ite
      (and (img@218@01 r) (Set_in (inv@217@01 r) xs@211@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@231@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@231@01  $FPM) r) $Perm.Write)
  :pattern ((inv@217@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] y1.g != y3.g
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and (img@218@01 y3@214@01) (Set_in (inv@217@01 y3@214@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@230@01  $FVF<g>) y1@212@01)
    ($FVF.lookup_g (as sm@230@01  $FVF<g>) y3@214@01)))))
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
(declare-const sm@232@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@223@01 r) (Set_in (inv@222@01 r) xs@211@01))
    (=
      ($FVF.lookup_f (as sm@232@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@215@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@232@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@215@01)))) r))
  :qid |qp.fvfValDef75|)))
(declare-const pm@233@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@233@01  $FPM) r)
    (ite
      (and (img@223@01 r) (Set_in (inv@222@01 r) xs@211@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@233@01  $FPM) r))
  :qid |qp.resPrmSumDef76|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@233@01  $FPM) r) $Perm.Write)
  :pattern ((inv@222@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@234@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@218@01 r) (Set_in (inv@217@01 r) xs@211@01))
    (=
      ($FVF.lookup_g (as sm@234@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) r)))
  :pattern (($FVF.lookup_g (as sm@234@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first $t@215@01)) r))
  :qid |qp.fvfValDef77|)))
(declare-const pm@235@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@235@01  $FPM) r)
    (ite
      (and (img@218@01 r) (Set_in (inv@217@01 r) xs@211@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_g (as pm@235@01  $FPM) r))
  :qid |qp.resPrmSumDef78|)))
; Assume upper permission bound for field g
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_g (as pm@235@01  $FPM) r) $Perm.Write)
  :pattern ((inv@217@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] y1.g != y3.g
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and (img@218@01 y3@214@01) (Set_in (inv@217@01 y3@214@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@234@01  $FVF<g>) y1@212@01)
    ($FVF.lookup_g (as sm@234@01  $FVF<g>) y3@214@01)))))
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
; Assume upper permission bound for field f
; Definitional axioms for snapshot map values
; Assume upper permission bound for field g
; [eval] y1.g != y3.g
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@218@01 y1@212@01) (Set_in (inv@217@01 y1@212@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and (img@218@01 y3@214@01) (Set_in (inv@217@01 y3@214@01) xs@211@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (not
  (=
    ($FVF.lookup_g (as sm@234@01  $FVF<g>) y1@212@01)
    ($FVF.lookup_g (as sm@234@01  $FVF<g>) y3@214@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const xs@236@01 Set<$Ref>)
(declare-const ys@237@01 Set<$Ref>)
(declare-const x@238@01 $Ref)
(declare-const xs@239@01 Set<$Ref>)
(declare-const ys@240@01 Set<$Ref>)
(declare-const x@241@01 $Ref)
(push) ; 1
(declare-const $t@242@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@243@01 Int)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@242@01 ($Snap.combine ($Snap.first $t@242@01) ($Snap.second $t@242@01))))
(declare-const x@244@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 6 | !(x@244@01 in xs@239@01) | live]
; [else-branch: 6 | x@244@01 in xs@239@01 | live]
(push) ; 5
; [then-branch: 6 | !(x@244@01 in xs@239@01)]
(assert (not (Set_in x@244@01 xs@239@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | x@244@01 in xs@239@01]
(assert (Set_in x@244@01 xs@239@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@244@01 xs@239@01) (not (Set_in x@244@01 xs@239@01))))
(assert (and (Set_in x@244@01 xs@239@01) (not (Set_in x@244@01 ys@240@01))))
(pop) ; 3
(declare-fun inv@245@01 ($Ref) $Ref)
(declare-fun img@246@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@244@01 $Ref)) (!
  (=>
    (and (Set_in x@244@01 xs@239@01) (not (Set_in x@244@01 ys@240@01)))
    (or (Set_in x@244@01 xs@239@01) (not (Set_in x@244@01 xs@239@01))))
  :pattern ((Set_in x@244@01 xs@239@01))
  :pattern ((Set_in x@244@01 ys@240@01))
  :pattern ((inv@245@01 x@244@01))
  :pattern ((img@246@01 x@244@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@244@01 $Ref) (x2@244@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@244@01 xs@239@01) (not (Set_in x1@244@01 ys@240@01)))
      (and (Set_in x2@244@01 xs@239@01) (not (Set_in x2@244@01 ys@240@01)))
      (= x1@244@01 x2@244@01))
    (= x1@244@01 x2@244@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@244@01 $Ref)) (!
  (=>
    (and (Set_in x@244@01 xs@239@01) (not (Set_in x@244@01 ys@240@01)))
    (and (= (inv@245@01 x@244@01) x@244@01) (img@246@01 x@244@01)))
  :pattern ((Set_in x@244@01 xs@239@01))
  :pattern ((Set_in x@244@01 ys@240@01))
  :pattern ((inv@245@01 x@244@01))
  :pattern ((img@246@01 x@244@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@246@01 r)
      (and
        (Set_in (inv@245@01 r) xs@239@01)
        (not (Set_in (inv@245@01 r) ys@240@01))))
    (= (inv@245@01 r) r))
  :pattern ((inv@245@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@244@01 $Ref)) (!
  (=>
    (and (Set_in x@244@01 xs@239@01) (not (Set_in x@244@01 ys@240@01)))
    (not (= x@244@01 $Ref.null)))
  :pattern ((Set_in x@244@01 xs@239@01))
  :pattern ((Set_in x@244@01 ys@240@01))
  :pattern ((inv@245@01 x@244@01))
  :pattern ((img@246@01 x@244@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@242@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@242@01))
    ($Snap.second ($Snap.second $t@242@01)))))
(declare-const x@247@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 7 | !(x@247@01 in xs@239@01) | live]
; [else-branch: 7 | x@247@01 in xs@239@01 | live]
(push) ; 5
; [then-branch: 7 | !(x@247@01 in xs@239@01)]
(assert (not (Set_in x@247@01 xs@239@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | x@247@01 in xs@239@01]
(assert (Set_in x@247@01 xs@239@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 8 | x@247@01 in ys@240@01 | live]
; [else-branch: 8 | !(x@247@01 in ys@240@01) | live]
(push) ; 7
; [then-branch: 8 | x@247@01 in ys@240@01]
(assert (Set_in x@247@01 ys@240@01))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | !(x@247@01 in ys@240@01)]
(assert (not (Set_in x@247@01 ys@240@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@246@01 x@247@01)
  (and
    (Set_in (inv@245@01 x@247@01) xs@239@01)
    (not (Set_in (inv@245@01 x@247@01) ys@240@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@247@01 ys@240@01)) (Set_in x@247@01 ys@240@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@247@01 xs@239@01)
  (and
    (Set_in x@247@01 xs@239@01)
    (or (not (Set_in x@247@01 ys@240@01)) (Set_in x@247@01 ys@240@01)))))
(assert (or (Set_in x@247@01 xs@239@01) (not (Set_in x@247@01 xs@239@01))))
(assert (and
  (Set_in x@247@01 xs@239@01)
  (and
    (not (Set_in x@247@01 ys@240@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01)
        0)))))
(pop) ; 3
(declare-fun inv@248@01 ($Ref) $Ref)
(declare-fun img@249@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@247@01 $Ref)) (!
  (=>
    (and
      (Set_in x@247@01 xs@239@01)
      (and
        (not (Set_in x@247@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01)
            0))))
    (and
      (=>
        (Set_in x@247@01 xs@239@01)
        (and
          (Set_in x@247@01 xs@239@01)
          (or (not (Set_in x@247@01 ys@240@01)) (Set_in x@247@01 ys@240@01))))
      (or (Set_in x@247@01 xs@239@01) (not (Set_in x@247@01 xs@239@01)))))
  :pattern ((Set_in x@247@01 xs@239@01))
  :pattern ((Set_in x@247@01 ys@240@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01))
  :pattern ((inv@248@01 x@247@01))
  :pattern ((img@249@01 x@247@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@247@01 $Ref) (x2@247@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@247@01 xs@239@01)
        (and
          (not (Set_in x1@247@01 ys@240@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@247@01)
              0))))
      (and
        (Set_in x2@247@01 xs@239@01)
        (and
          (not (Set_in x2@247@01 ys@240@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@247@01)
              0))))
      (= x1@247@01 x2@247@01))
    (= x1@247@01 x2@247@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@247@01 $Ref)) (!
  (=>
    (and
      (Set_in x@247@01 xs@239@01)
      (and
        (not (Set_in x@247@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01)
            0))))
    (and (= (inv@248@01 x@247@01) x@247@01) (img@249@01 x@247@01)))
  :pattern ((Set_in x@247@01 xs@239@01))
  :pattern ((Set_in x@247@01 ys@240@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01))
  :pattern ((inv@248@01 x@247@01))
  :pattern ((img@249@01 x@247@01))
  :qid |quant-u-74|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@249@01 r)
      (and
        (Set_in (inv@248@01 r) xs@239@01)
        (and
          (not (Set_in (inv@248@01 r) ys@240@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 r))
              0)))))
    (= (inv@248@01 r) r))
  :pattern ((inv@248@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@247@01 $Ref)) (!
  (=>
    (and
      (Set_in x@247@01 xs@239@01)
      (and
        (not (Set_in x@247@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01)
            0))))
    (not (= x@247@01 $Ref.null)))
  :pattern ((Set_in x@247@01 xs@239@01))
  :pattern ((Set_in x@247@01 ys@240@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@247@01))
  :pattern ((inv@248@01 x@247@01))
  :pattern ((img@249@01 x@247@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@242@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@242@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@242@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@242@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@250@01 $Ref)
(declare-const x2@251@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 9 | !(x1@250@01 in xs@239@01) | live]
; [else-branch: 9 | x1@250@01 in xs@239@01 | live]
(push) ; 5
; [then-branch: 9 | !(x1@250@01 in xs@239@01)]
(assert (not (Set_in x1@250@01 xs@239@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | x1@250@01 in xs@239@01]
(assert (Set_in x1@250@01 xs@239@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 10 | x1@250@01 in ys@240@01 | live]
; [else-branch: 10 | !(x1@250@01 in ys@240@01) | live]
(push) ; 7
; [then-branch: 10 | x1@250@01 in ys@240@01]
(assert (Set_in x1@250@01 ys@240@01))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | !(x1@250@01 in ys@240@01)]
(assert (not (Set_in x1@250@01 ys@240@01)))
; [eval] x1.f != 0
(push) ; 8
(assert (not (and
  (img@246@01 x1@250@01)
  (and
    (Set_in (inv@245@01 x1@250@01) xs@239@01)
    (not (Set_in (inv@245@01 x1@250@01) ys@240@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 11 | Lookup(f, First:($t@242@01), x1@250@01) == 0 | live]
; [else-branch: 11 | Lookup(f, First:($t@242@01), x1@250@01) != 0 | live]
(push) ; 9
; [then-branch: 11 | Lookup(f, First:($t@242@01), x1@250@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | Lookup(f, First:($t@242@01), x1@250@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
    0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(push) ; 10
(assert (not (and
  (img@249@01 x1@250@01)
  (and
    (Set_in (inv@248@01 x1@250@01) xs@239@01)
    (and
      (not (Set_in (inv@248@01 x1@250@01) ys@240@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 x1@250@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 12 | Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01 | live]
; [else-branch: 12 | !(Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01) | live]
(push) ; 11
; [then-branch: 12 | Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
(pop) ; 11
(push) ; 11
; [else-branch: 12 | !(Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 13 | !(x2@251@01 in xs@239@01) | live]
; [else-branch: 13 | x2@251@01 in xs@239@01 | live]
(push) ; 13
; [then-branch: 13 | !(x2@251@01 in xs@239@01)]
(assert (not (Set_in x2@251@01 xs@239@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 13 | x2@251@01 in xs@239@01]
(assert (Set_in x2@251@01 xs@239@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 14 | x2@251@01 in ys@240@01 | live]
; [else-branch: 14 | !(x2@251@01 in ys@240@01) | live]
(push) ; 15
; [then-branch: 14 | x2@251@01 in ys@240@01]
(assert (Set_in x2@251@01 ys@240@01))
(pop) ; 15
(push) ; 15
; [else-branch: 14 | !(x2@251@01 in ys@240@01)]
(assert (not (Set_in x2@251@01 ys@240@01)))
; [eval] x2.f != 0
(push) ; 16
(assert (not (and
  (img@246@01 x2@251@01)
  (and
    (Set_in (inv@245@01 x2@251@01) xs@239@01)
    (not (Set_in (inv@245@01 x2@251@01) ys@240@01))))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 15 | Lookup(f, First:($t@242@01), x2@251@01) == 0 | live]
; [else-branch: 15 | Lookup(f, First:($t@242@01), x2@251@01) != 0 | live]
(push) ; 17
; [then-branch: 15 | Lookup(f, First:($t@242@01), x2@251@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
  0))
(pop) ; 17
(push) ; 17
; [else-branch: 15 | Lookup(f, First:($t@242@01), x2@251@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
    0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(push) ; 18
(assert (not (and
  (img@249@01 x2@251@01)
  (and
    (Set_in (inv@248@01 x2@251@01) xs@239@01)
    (and
      (not (Set_in (inv@248@01 x2@251@01) ys@240@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 x2@251@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 16 | Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01 | live]
; [else-branch: 16 | !(Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01) | live]
(push) ; 19
; [then-branch: 16 | Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
(pop) ; 19
(push) ; 19
; [else-branch: 16 | !(Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01)))
; [eval] x1 != x2
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
        0))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
    0)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x2@251@01 ys@240@01))
  (and
    (not (Set_in x2@251@01 ys@240@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
        0)))))
(assert (or (not (Set_in x2@251@01 ys@240@01)) (Set_in x2@251@01 ys@240@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x2@251@01 xs@239@01)
  (and
    (Set_in x2@251@01 xs@239@01)
    (=>
      (not (Set_in x2@251@01 ys@240@01))
      (and
        (not (Set_in x2@251@01 ys@240@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                0))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))))
    (or (not (Set_in x2@251@01 ys@240@01)) (Set_in x2@251@01 ys@240@01)))))
(assert (or (Set_in x2@251@01 xs@239@01) (not (Set_in x2@251@01 xs@239@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
  (and
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
    (=>
      (Set_in x2@251@01 xs@239@01)
      (and
        (Set_in x2@251@01 xs@239@01)
        (=>
          (not (Set_in x2@251@01 ys@240@01))
          (and
            (not (Set_in x2@251@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                    0))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                0))))
        (or (not (Set_in x2@251@01 ys@240@01)) (Set_in x2@251@01 ys@240@01))))
    (or (Set_in x2@251@01 xs@239@01) (not (Set_in x2@251@01 xs@239@01))))))
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
        0))
    (=>
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (=>
          (Set_in x2@251@01 xs@239@01)
          (and
            (Set_in x2@251@01 xs@239@01)
            (=>
              (not (Set_in x2@251@01 ys@240@01))
              (and
                (not (Set_in x2@251@01 ys@240@01))
                (=>
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                      0))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (or
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                (or
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                      0))
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                    0))))
            (or (not (Set_in x2@251@01 ys@240@01)) (Set_in x2@251@01 ys@240@01))))
        (or (Set_in x2@251@01 xs@239@01) (not (Set_in x2@251@01 xs@239@01)))))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x1@250@01 ys@240@01))
  (and
    (not (Set_in x1@250@01 ys@240@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (=>
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
            (=>
              (Set_in x2@251@01 xs@239@01)
              (and
                (Set_in x2@251@01 xs@239@01)
                (=>
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (=>
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                            0))
                        (or
                          (not
                            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                    (or
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))))
                (or
                  (not (Set_in x2@251@01 ys@240@01))
                  (Set_in x2@251@01 ys@240@01))))
            (or (Set_in x2@251@01 xs@239@01) (not (Set_in x2@251@01 xs@239@01)))))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
        0)))))
(assert (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x1@250@01 xs@239@01)
  (and
    (Set_in x1@250@01 xs@239@01)
    (=>
      (not (Set_in x1@250@01 ys@240@01))
      (and
        (not (Set_in x1@250@01 ys@240@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (=>
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (=>
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (Set_in x2@251@01 xs@239@01)
                    (=>
                      (not (Set_in x2@251@01 ys@240@01))
                      (and
                        (not (Set_in x2@251@01 ys@240@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))
                            (or
                              (not
                                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                        (or
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                              0))
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                            0))))
                    (or
                      (not (Set_in x2@251@01 ys@240@01))
                      (Set_in x2@251@01 ys@240@01))))
                (or
                  (Set_in x2@251@01 xs@239@01)
                  (not (Set_in x2@251@01 xs@239@01)))))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))))
    (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01)))))
(assert (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01))))
(push) ; 4
; [then-branch: 17 | x1@250@01 in xs@239@01 && !(x1@250@01 in ys@240@01) && Lookup(f, First:($t@242@01), x1@250@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01) && x2@251@01 in xs@239@01 && !(x2@251@01 in ys@240@01) && Lookup(f, First:($t@242@01), x2@251@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01) && x1@250@01 != x2@251@01 | live]
; [else-branch: 17 | !(x1@250@01 in xs@239@01 && !(x1@250@01 in ys@240@01) && Lookup(f, First:($t@242@01), x1@250@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01) && x2@251@01 in xs@239@01 && !(x2@251@01 in ys@240@01) && Lookup(f, First:($t@242@01), x2@251@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01) && x1@250@01 != x2@251@01) | live]
(push) ; 5
; [then-branch: 17 | x1@250@01 in xs@239@01 && !(x1@250@01 in ys@240@01) && Lookup(f, First:($t@242@01), x1@250@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01) && x2@251@01 in xs@239@01 && !(x2@251@01 in ys@240@01) && Lookup(f, First:($t@242@01), x2@251@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01) && x1@250@01 != x2@251@01]
(assert (and
  (Set_in x1@250@01 xs@239@01)
  (and
    (not (Set_in x1@250@01 ys@240@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
          0))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (and
          (Set_in x2@251@01 xs@239@01)
          (and
            (not (Set_in x2@251@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                (not (= x1@250@01 x2@251@01)))))))))))
; [eval] x1.g != x2.g
(push) ; 6
(assert (not (and
  (img@249@01 x1@250@01)
  (and
    (Set_in (inv@248@01 x1@250@01) xs@239@01)
    (and
      (not (Set_in (inv@248@01 x1@250@01) ys@240@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 x1@250@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@249@01 x2@251@01)
  (and
    (Set_in (inv@248@01 x2@251@01) xs@239@01)
    (and
      (not (Set_in (inv@248@01 x2@251@01) ys@240@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 x2@251@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(x1@250@01 in xs@239@01 && !(x1@250@01 in ys@240@01) && Lookup(f, First:($t@242@01), x1@250@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x1@250@01) in xs@239@01) && x2@251@01 in xs@239@01 && !(x2@251@01 in ys@240@01) && Lookup(f, First:($t@242@01), x2@251@01) != 0 && !(Lookup(g, First:(Second:($t@242@01)), x2@251@01) in xs@239@01) && x1@250@01 != x2@251@01)]
(assert (not
  (and
    (Set_in x1@250@01 xs@239@01)
    (and
      (not (Set_in x1@250@01 ys@240@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
          (and
            (Set_in x2@251@01 xs@239@01)
            (and
              (not (Set_in x2@251@01 ys@240@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                  (not (= x1@250@01 x2@251@01))))))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x1@250@01 xs@239@01)
    (and
      (not (Set_in x1@250@01 ys@240@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
          (and
            (Set_in x2@251@01 xs@239@01)
            (and
              (not (Set_in x2@251@01 ys@240@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                  (not (= x1@250@01 x2@251@01))))))))))
  (and
    (Set_in x1@250@01 xs@239@01)
    (not (Set_in x1@250@01 ys@240@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
    (Set_in x2@251@01 xs@239@01)
    (not (Set_in x2@251@01 ys@240@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
    (not (= x1@250@01 x2@251@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x1@250@01 xs@239@01)
      (and
        (not (Set_in x1@250@01 ys@240@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
            (and
              (Set_in x2@251@01 xs@239@01)
              (and
                (not (Set_in x2@251@01 ys@240@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                    (not (= x1@250@01 x2@251@01)))))))))))
  (and
    (Set_in x1@250@01 xs@239@01)
    (and
      (not (Set_in x1@250@01 ys@240@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
          (and
            (Set_in x2@251@01 xs@239@01)
            (and
              (not (Set_in x2@251@01 ys@240@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                  (not (= x1@250@01 x2@251@01))))))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in x1@250@01 xs@239@01) (Set_in x2@251@01 xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in x1@250@01 xs@239@01) (Set_in x2@251@01 ys@240@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in x1@250@01 xs@239@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in x1@250@01 ys@240@01) (Set_in x2@251@01 xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in x1@250@01 ys@240@01) (Set_in x2@251@01 ys@240@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in x1@250@01 ys@240@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01) (Set_in x2@251@01 xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01) (Set_in x2@251@01 ys@240@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@250@01 xs@239@01)
      (and
        (Set_in x1@250@01 xs@239@01)
        (=>
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                    (=>
                      (Set_in x2@251@01 xs@239@01)
                      (and
                        (Set_in x2@251@01 xs@239@01)
                        (=>
                          (not (Set_in x2@251@01 ys@240@01))
                          (and
                            (not (Set_in x2@251@01 ys@240@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                                0))))
                        (or
                          (not (Set_in x2@251@01 ys@240@01))
                          (Set_in x2@251@01 ys@240@01))))
                    (or
                      (Set_in x2@251@01 xs@239@01)
                      (not (Set_in x2@251@01 xs@239@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))))
        (or (not (Set_in x1@250@01 ys@240@01)) (Set_in x1@250@01 ys@240@01))))
    (or (Set_in x1@250@01 xs@239@01) (not (Set_in x1@250@01 xs@239@01)))
    (=>
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (not (Set_in x1@250@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
        (Set_in x2@251@01 xs@239@01)
        (not (Set_in x2@251@01 ys@240@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
        (not (= x1@250@01 x2@251@01))))
    (or
      (not
        (and
          (Set_in x1@250@01 xs@239@01)
          (and
            (not (Set_in x1@250@01 ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
                (and
                  (Set_in x2@251@01 xs@239@01)
                  (and
                    (not (Set_in x2@251@01 ys@240@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                        (not (= x1@250@01 x2@251@01)))))))))))
      (and
        (Set_in x1@250@01 xs@239@01)
        (and
          (not (Set_in x1@250@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
              (and
                (Set_in x2@251@01 xs@239@01)
                (and
                  (not (Set_in x2@251@01 ys@240@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                      (not (= x1@250@01 x2@251@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@250@01 $Ref) (x2@251@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@250@01 xs@239@01)
      (and
        (not (Set_in x1@250@01 ys@240@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@250@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01))
            (and
              (Set_in x2@251@01 xs@239@01)
              (and
                (not (Set_in x2@251@01 ys@240@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@251@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
                    (not (= x1@250@01 x2@251@01))))))))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01))))
  :pattern ((Set_in x1@250@01 xs@239@01) (Set_in x2@251@01 xs@239@01))
  :pattern ((Set_in x1@250@01 xs@239@01) (Set_in x2@251@01 ys@240@01))
  :pattern ((Set_in x1@250@01 xs@239@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  :pattern ((Set_in x1@250@01 ys@240@01) (Set_in x2@251@01 xs@239@01))
  :pattern ((Set_in x1@250@01 ys@240@01) (Set_in x2@251@01 ys@240@01))
  :pattern ((Set_in x1@250@01 ys@240@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01) (Set_in x2@251@01 xs@239@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01) (Set_in x2@251@01 ys@240@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@250@01) xs@239@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@251@01) xs@239@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92|)))
(declare-const x@252@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 18 | !(x@252@01 in xs@239@01) | live]
; [else-branch: 18 | x@252@01 in xs@239@01 | live]
(push) ; 5
; [then-branch: 18 | !(x@252@01 in xs@239@01)]
(assert (not (Set_in x@252@01 xs@239@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | x@252@01 in xs@239@01]
(assert (Set_in x@252@01 xs@239@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 19 | x@252@01 in ys@240@01 | live]
; [else-branch: 19 | !(x@252@01 in ys@240@01) | live]
(push) ; 7
; [then-branch: 19 | x@252@01 in ys@240@01]
(assert (Set_in x@252@01 ys@240@01))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | !(x@252@01 in ys@240@01)]
(assert (not (Set_in x@252@01 ys@240@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@246@01 x@252@01)
  (and
    (Set_in (inv@245@01 x@252@01) xs@239@01)
    (not (Set_in (inv@245@01 x@252@01) ys@240@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 20 | Lookup(f, First:($t@242@01), x@252@01) == 0 | live]
; [else-branch: 20 | Lookup(f, First:($t@242@01), x@252@01) != 0 | live]
(push) ; 9
; [then-branch: 20 | Lookup(f, First:($t@242@01), x@252@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | Lookup(f, First:($t@242@01), x@252@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
    0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(push) ; 10
(assert (not (and
  (img@249@01 x@252@01)
  (and
    (Set_in (inv@248@01 x@252@01) xs@239@01)
    (and
      (not (Set_in (inv@248@01 x@252@01) ys@240@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 x@252@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x@252@01 ys@240@01))
  (and
    (not (Set_in x@252@01 ys@240@01))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
        0)))))
(assert (or (not (Set_in x@252@01 ys@240@01)) (Set_in x@252@01 ys@240@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@252@01 xs@239@01)
  (and
    (Set_in x@252@01 xs@239@01)
    (=>
      (not (Set_in x@252@01 ys@240@01))
      (and
        (not (Set_in x@252@01 ys@240@01))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
            0))))
    (or (not (Set_in x@252@01 ys@240@01)) (Set_in x@252@01 ys@240@01)))))
(assert (or (Set_in x@252@01 xs@239@01) (not (Set_in x@252@01 xs@239@01))))
(assert (and
  (Set_in x@252@01 xs@239@01)
  (and
    (not (Set_in x@252@01 ys@240@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
          0))
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01) xs@239@01))))))
(push) ; 4
(assert (not (and
  (img@249@01 x@252@01)
  (and
    (Set_in (inv@248@01 x@252@01) xs@239@01)
    (and
      (not (Set_in (inv@248@01 x@252@01) ys@240@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@248@01 x@252@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@253@01 ($Ref) $Ref)
(declare-fun img@254@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@252@01 $Ref)) (!
  (=>
    (and
      (Set_in x@252@01 xs@239@01)
      (and
        (not (Set_in x@252@01 ys@240@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01) xs@239@01)))))
    (and
      (=>
        (Set_in x@252@01 xs@239@01)
        (and
          (Set_in x@252@01 xs@239@01)
          (=>
            (not (Set_in x@252@01 ys@240@01))
            (and
              (not (Set_in x@252@01 ys@240@01))
              (or
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
                    0))
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
                  0))))
          (or (not (Set_in x@252@01 ys@240@01)) (Set_in x@252@01 ys@240@01))))
      (or (Set_in x@252@01 xs@239@01) (not (Set_in x@252@01 xs@239@01)))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@252@01 $Ref) (x2@252@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@252@01 xs@239@01)
        (and
          (not (Set_in x1@252@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x1@252@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@252@01) xs@239@01)))))
      (and
        (Set_in x2@252@01 xs@239@01)
        (and
          (not (Set_in x2@252@01 ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x2@252@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@252@01) xs@239@01)))))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x1@252@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x2@252@01)))
    (= x1@252@01 x2@252@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@252@01 $Ref)) (!
  (=>
    (and
      (Set_in x@252@01 xs@239@01)
      (and
        (not (Set_in x@252@01 ys@240@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01) xs@239@01)))))
    (and
      (=
        (inv@253@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01))
        x@252@01)
      (img@254@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01))
  :qid |quant-u-76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@254@01 r)
      (and
        (Set_in (inv@253@01 r) xs@239@01)
        (and
          (not (Set_in (inv@253@01 r) ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@253@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) (inv@253@01 r)) xs@239@01))))))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) (inv@253@01 r))
      r))
  :pattern ((inv@253@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@252@01 $Ref)) (!
  (=>
    (and
      (Set_in x@252@01 xs@239@01)
      (and
        (not (Set_in x@252@01 ys@240@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) x@252@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01) xs@239@01)))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) x@252@01)
      x@244@01)
    (=
      (and
        (img@254@01 r)
        (and
          (Set_in (inv@253@01 r) xs@239@01)
          (and
            (not (Set_in (inv@253@01 r) ys@240@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@253@01 r))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) (inv@253@01 r)) xs@239@01))))))
      (and
        (img@246@01 r)
        (and
          (Set_in (inv@245@01 r) xs@239@01)
          (not (Set_in (inv@245@01 r) ys@240@01))))))
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@242@01 xs@239@01 ys@240@01))
; [exec]
; inhale (x in xs)
(declare-const $t@255@01 $Snap)
(assert (= $t@255@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@241@01 xs@239@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@256@01 $Snap)
(assert (= $t@256@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@241@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@257@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@246@01 r)
      (and
        (Set_in (inv@245@01 r) xs@239@01)
        (not (Set_in (inv@245@01 r) ys@240@01))))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) r)))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@254@01 r)
      (and
        (Set_in (inv@253@01 r) xs@239@01)
        (and
          (not (Set_in (inv@253@01 r) ys@240@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@253@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) (inv@253@01 r)) xs@239@01))))))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@242@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@242@01)))) r))
  :qid |qp.fvfValDef80|)))
(declare-const pm@258@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@258@01  $FPM) r)
    (+
      (ite
        (and
          (img@246@01 r)
          (and
            (Set_in (inv@245@01 r) xs@239@01)
            (not (Set_in (inv@245@01 r) ys@240@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@254@01 r)
          (and
            (Set_in (inv@253@01 r) xs@239@01)
            (and
              (not (Set_in (inv@253@01 r) ys@240@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@242@01)) (inv@253@01 r))
                    0))
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@242@01))) (inv@253@01 r)) xs@239@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@258@01  $FPM) r))
  :qid |qp.resPrmSumDef81|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@258@01  $FPM) x@241@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@259@01 Set<$Ref>)
(declare-const ys@260@01 Set<$Ref>)
(declare-const x@261@01 $Ref)
(declare-const xs@262@01 Set<$Ref>)
(declare-const ys@263@01 Set<$Ref>)
(declare-const x@264@01 $Ref)
(push) ; 1
(declare-const $t@265@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@266@01 Int)
; [exec]
; var b: Ref
(declare-const b@267@01 $Ref)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@265@01 ($Snap.combine ($Snap.first $t@265@01) ($Snap.second $t@265@01))))
(declare-const x@268@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 21 | !(x@268@01 in xs@262@01) | live]
; [else-branch: 21 | x@268@01 in xs@262@01 | live]
(push) ; 5
; [then-branch: 21 | !(x@268@01 in xs@262@01)]
(assert (not (Set_in x@268@01 xs@262@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | x@268@01 in xs@262@01]
(assert (Set_in x@268@01 xs@262@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@268@01 xs@262@01) (not (Set_in x@268@01 xs@262@01))))
(assert (and (Set_in x@268@01 xs@262@01) (not (Set_in x@268@01 ys@263@01))))
(pop) ; 3
(declare-fun inv@269@01 ($Ref) $Ref)
(declare-fun img@270@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@268@01 $Ref)) (!
  (=>
    (and (Set_in x@268@01 xs@262@01) (not (Set_in x@268@01 ys@263@01)))
    (or (Set_in x@268@01 xs@262@01) (not (Set_in x@268@01 xs@262@01))))
  :pattern ((Set_in x@268@01 xs@262@01))
  :pattern ((Set_in x@268@01 ys@263@01))
  :pattern ((inv@269@01 x@268@01))
  :pattern ((img@270@01 x@268@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@268@01 $Ref) (x2@268@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@268@01 xs@262@01) (not (Set_in x1@268@01 ys@263@01)))
      (and (Set_in x2@268@01 xs@262@01) (not (Set_in x2@268@01 ys@263@01)))
      (= x1@268@01 x2@268@01))
    (= x1@268@01 x2@268@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@268@01 $Ref)) (!
  (=>
    (and (Set_in x@268@01 xs@262@01) (not (Set_in x@268@01 ys@263@01)))
    (and (= (inv@269@01 x@268@01) x@268@01) (img@270@01 x@268@01)))
  :pattern ((Set_in x@268@01 xs@262@01))
  :pattern ((Set_in x@268@01 ys@263@01))
  :pattern ((inv@269@01 x@268@01))
  :pattern ((img@270@01 x@268@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and
        (Set_in (inv@269@01 r) xs@262@01)
        (not (Set_in (inv@269@01 r) ys@263@01))))
    (= (inv@269@01 r) r))
  :pattern ((inv@269@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@268@01 $Ref)) (!
  (=>
    (and (Set_in x@268@01 xs@262@01) (not (Set_in x@268@01 ys@263@01)))
    (not (= x@268@01 $Ref.null)))
  :pattern ((Set_in x@268@01 xs@262@01))
  :pattern ((Set_in x@268@01 ys@263@01))
  :pattern ((inv@269@01 x@268@01))
  :pattern ((img@270@01 x@268@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@265@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@265@01))
    ($Snap.second ($Snap.second $t@265@01)))))
(declare-const x@271@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 22 | !(x@271@01 in xs@262@01) | live]
; [else-branch: 22 | x@271@01 in xs@262@01 | live]
(push) ; 5
; [then-branch: 22 | !(x@271@01 in xs@262@01)]
(assert (not (Set_in x@271@01 xs@262@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | x@271@01 in xs@262@01]
(assert (Set_in x@271@01 xs@262@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 23 | x@271@01 in ys@263@01 | live]
; [else-branch: 23 | !(x@271@01 in ys@263@01) | live]
(push) ; 7
; [then-branch: 23 | x@271@01 in ys@263@01]
(assert (Set_in x@271@01 ys@263@01))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | !(x@271@01 in ys@263@01)]
(assert (not (Set_in x@271@01 ys@263@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@270@01 x@271@01)
  (and
    (Set_in (inv@269@01 x@271@01) xs@262@01)
    (not (Set_in (inv@269@01 x@271@01) ys@263@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@271@01 ys@263@01)) (Set_in x@271@01 ys@263@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@271@01 xs@262@01)
  (and
    (Set_in x@271@01 xs@262@01)
    (or (not (Set_in x@271@01 ys@263@01)) (Set_in x@271@01 ys@263@01)))))
(assert (or (Set_in x@271@01 xs@262@01) (not (Set_in x@271@01 xs@262@01))))
(assert (and
  (Set_in x@271@01 xs@262@01)
  (and
    (not (Set_in x@271@01 ys@263@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01)
        0)))))
(pop) ; 3
(declare-fun inv@272@01 ($Ref) $Ref)
(declare-fun img@273@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@271@01 $Ref)) (!
  (=>
    (and
      (Set_in x@271@01 xs@262@01)
      (and
        (not (Set_in x@271@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01)
            0))))
    (and
      (=>
        (Set_in x@271@01 xs@262@01)
        (and
          (Set_in x@271@01 xs@262@01)
          (or (not (Set_in x@271@01 ys@263@01)) (Set_in x@271@01 ys@263@01))))
      (or (Set_in x@271@01 xs@262@01) (not (Set_in x@271@01 xs@262@01)))))
  :pattern ((Set_in x@271@01 xs@262@01))
  :pattern ((Set_in x@271@01 ys@263@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01))
  :pattern ((inv@272@01 x@271@01))
  :pattern ((img@273@01 x@271@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@271@01 $Ref) (x2@271@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@271@01 xs@262@01)
        (and
          (not (Set_in x1@271@01 ys@263@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@271@01)
              0))))
      (and
        (Set_in x2@271@01 xs@262@01)
        (and
          (not (Set_in x2@271@01 ys@263@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@271@01)
              0))))
      (= x1@271@01 x2@271@01))
    (= x1@271@01 x2@271@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@271@01 $Ref)) (!
  (=>
    (and
      (Set_in x@271@01 xs@262@01)
      (and
        (not (Set_in x@271@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01)
            0))))
    (and (= (inv@272@01 x@271@01) x@271@01) (img@273@01 x@271@01)))
  :pattern ((Set_in x@271@01 xs@262@01))
  :pattern ((Set_in x@271@01 ys@263@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01))
  :pattern ((inv@272@01 x@271@01))
  :pattern ((img@273@01 x@271@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@273@01 r)
      (and
        (Set_in (inv@272@01 r) xs@262@01)
        (and
          (not (Set_in (inv@272@01 r) ys@263@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 r))
              0)))))
    (= (inv@272@01 r) r))
  :pattern ((inv@272@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@271@01 $Ref)) (!
  (=>
    (and
      (Set_in x@271@01 xs@262@01)
      (and
        (not (Set_in x@271@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01)
            0))))
    (not (= x@271@01 $Ref.null)))
  :pattern ((Set_in x@271@01 xs@262@01))
  :pattern ((Set_in x@271@01 ys@263@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@271@01))
  :pattern ((inv@272@01 x@271@01))
  :pattern ((img@273@01 x@271@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@265@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@265@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@265@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@265@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@274@01 $Ref)
(declare-const x2@275@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 24 | !(x1@274@01 in xs@262@01) | live]
; [else-branch: 24 | x1@274@01 in xs@262@01 | live]
(push) ; 5
; [then-branch: 24 | !(x1@274@01 in xs@262@01)]
(assert (not (Set_in x1@274@01 xs@262@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | x1@274@01 in xs@262@01]
(assert (Set_in x1@274@01 xs@262@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 25 | x1@274@01 in ys@263@01 | live]
; [else-branch: 25 | !(x1@274@01 in ys@263@01) | live]
(push) ; 7
; [then-branch: 25 | x1@274@01 in ys@263@01]
(assert (Set_in x1@274@01 ys@263@01))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | !(x1@274@01 in ys@263@01)]
(assert (not (Set_in x1@274@01 ys@263@01)))
; [eval] x1.f != 0
(push) ; 8
(assert (not (and
  (img@270@01 x1@274@01)
  (and
    (Set_in (inv@269@01 x1@274@01) xs@262@01)
    (not (Set_in (inv@269@01 x1@274@01) ys@263@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 26 | Lookup(f, First:($t@265@01), x1@274@01) == 0 | live]
; [else-branch: 26 | Lookup(f, First:($t@265@01), x1@274@01) != 0 | live]
(push) ; 9
; [then-branch: 26 | Lookup(f, First:($t@265@01), x1@274@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | Lookup(f, First:($t@265@01), x1@274@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
    0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(push) ; 10
(assert (not (and
  (img@273@01 x1@274@01)
  (and
    (Set_in (inv@272@01 x1@274@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x1@274@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x1@274@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 27 | Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01 | live]
; [else-branch: 27 | !(Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01) | live]
(push) ; 11
; [then-branch: 27 | Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
(pop) ; 11
(push) ; 11
; [else-branch: 27 | !(Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 28 | !(x2@275@01 in xs@262@01) | live]
; [else-branch: 28 | x2@275@01 in xs@262@01 | live]
(push) ; 13
; [then-branch: 28 | !(x2@275@01 in xs@262@01)]
(assert (not (Set_in x2@275@01 xs@262@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 28 | x2@275@01 in xs@262@01]
(assert (Set_in x2@275@01 xs@262@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 29 | x2@275@01 in ys@263@01 | live]
; [else-branch: 29 | !(x2@275@01 in ys@263@01) | live]
(push) ; 15
; [then-branch: 29 | x2@275@01 in ys@263@01]
(assert (Set_in x2@275@01 ys@263@01))
(pop) ; 15
(push) ; 15
; [else-branch: 29 | !(x2@275@01 in ys@263@01)]
(assert (not (Set_in x2@275@01 ys@263@01)))
; [eval] x2.f != 0
(push) ; 16
(assert (not (and
  (img@270@01 x2@275@01)
  (and
    (Set_in (inv@269@01 x2@275@01) xs@262@01)
    (not (Set_in (inv@269@01 x2@275@01) ys@263@01))))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 30 | Lookup(f, First:($t@265@01), x2@275@01) == 0 | live]
; [else-branch: 30 | Lookup(f, First:($t@265@01), x2@275@01) != 0 | live]
(push) ; 17
; [then-branch: 30 | Lookup(f, First:($t@265@01), x2@275@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
  0))
(pop) ; 17
(push) ; 17
; [else-branch: 30 | Lookup(f, First:($t@265@01), x2@275@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
    0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(push) ; 18
(assert (not (and
  (img@273@01 x2@275@01)
  (and
    (Set_in (inv@272@01 x2@275@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x2@275@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x2@275@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 31 | Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01 | live]
; [else-branch: 31 | !(Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01) | live]
(push) ; 19
; [then-branch: 31 | Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
(pop) ; 19
(push) ; 19
; [else-branch: 31 | !(Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01)))
; [eval] x1 != x2
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
        0))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
    0)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x2@275@01 ys@263@01))
  (and
    (not (Set_in x2@275@01 ys@263@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
        0)))))
(assert (or (not (Set_in x2@275@01 ys@263@01)) (Set_in x2@275@01 ys@263@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x2@275@01 xs@262@01)
  (and
    (Set_in x2@275@01 xs@262@01)
    (=>
      (not (Set_in x2@275@01 ys@263@01))
      (and
        (not (Set_in x2@275@01 ys@263@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                0))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))))
    (or (not (Set_in x2@275@01 ys@263@01)) (Set_in x2@275@01 ys@263@01)))))
(assert (or (Set_in x2@275@01 xs@262@01) (not (Set_in x2@275@01 xs@262@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
  (and
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
    (=>
      (Set_in x2@275@01 xs@262@01)
      (and
        (Set_in x2@275@01 xs@262@01)
        (=>
          (not (Set_in x2@275@01 ys@263@01))
          (and
            (not (Set_in x2@275@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                    0))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                0))))
        (or (not (Set_in x2@275@01 ys@263@01)) (Set_in x2@275@01 ys@263@01))))
    (or (Set_in x2@275@01 xs@262@01) (not (Set_in x2@275@01 xs@262@01))))))
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
        0))
    (=>
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (=>
          (Set_in x2@275@01 xs@262@01)
          (and
            (Set_in x2@275@01 xs@262@01)
            (=>
              (not (Set_in x2@275@01 ys@263@01))
              (and
                (not (Set_in x2@275@01 ys@263@01))
                (=>
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                      0))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (or
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                (or
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                      0))
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                    0))))
            (or (not (Set_in x2@275@01 ys@263@01)) (Set_in x2@275@01 ys@263@01))))
        (or (Set_in x2@275@01 xs@262@01) (not (Set_in x2@275@01 xs@262@01)))))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x1@274@01 ys@263@01))
  (and
    (not (Set_in x1@274@01 ys@263@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (=>
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
            (=>
              (Set_in x2@275@01 xs@262@01)
              (and
                (Set_in x2@275@01 xs@262@01)
                (=>
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (=>
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                            0))
                        (or
                          (not
                            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                    (or
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))))
                (or
                  (not (Set_in x2@275@01 ys@263@01))
                  (Set_in x2@275@01 ys@263@01))))
            (or (Set_in x2@275@01 xs@262@01) (not (Set_in x2@275@01 xs@262@01)))))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
        0)))))
(assert (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x1@274@01 xs@262@01)
  (and
    (Set_in x1@274@01 xs@262@01)
    (=>
      (not (Set_in x1@274@01 ys@263@01))
      (and
        (not (Set_in x1@274@01 ys@263@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (=>
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (=>
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (Set_in x2@275@01 xs@262@01)
                    (=>
                      (not (Set_in x2@275@01 ys@263@01))
                      (and
                        (not (Set_in x2@275@01 ys@263@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))
                            (or
                              (not
                                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                        (or
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                              0))
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                            0))))
                    (or
                      (not (Set_in x2@275@01 ys@263@01))
                      (Set_in x2@275@01 ys@263@01))))
                (or
                  (Set_in x2@275@01 xs@262@01)
                  (not (Set_in x2@275@01 xs@262@01)))))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))))
    (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01)))))
(assert (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01))))
(push) ; 4
; [then-branch: 32 | x1@274@01 in xs@262@01 && !(x1@274@01 in ys@263@01) && Lookup(f, First:($t@265@01), x1@274@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01) && x2@275@01 in xs@262@01 && !(x2@275@01 in ys@263@01) && Lookup(f, First:($t@265@01), x2@275@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01) && x1@274@01 != x2@275@01 | live]
; [else-branch: 32 | !(x1@274@01 in xs@262@01 && !(x1@274@01 in ys@263@01) && Lookup(f, First:($t@265@01), x1@274@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01) && x2@275@01 in xs@262@01 && !(x2@275@01 in ys@263@01) && Lookup(f, First:($t@265@01), x2@275@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01) && x1@274@01 != x2@275@01) | live]
(push) ; 5
; [then-branch: 32 | x1@274@01 in xs@262@01 && !(x1@274@01 in ys@263@01) && Lookup(f, First:($t@265@01), x1@274@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01) && x2@275@01 in xs@262@01 && !(x2@275@01 in ys@263@01) && Lookup(f, First:($t@265@01), x2@275@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01) && x1@274@01 != x2@275@01]
(assert (and
  (Set_in x1@274@01 xs@262@01)
  (and
    (not (Set_in x1@274@01 ys@263@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
          0))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (and
          (Set_in x2@275@01 xs@262@01)
          (and
            (not (Set_in x2@275@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                (not (= x1@274@01 x2@275@01)))))))))))
; [eval] x1.g != x2.g
(push) ; 6
(assert (not (and
  (img@273@01 x1@274@01)
  (and
    (Set_in (inv@272@01 x1@274@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x1@274@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x1@274@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@273@01 x2@275@01)
  (and
    (Set_in (inv@272@01 x2@275@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x2@275@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x2@275@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(x1@274@01 in xs@262@01 && !(x1@274@01 in ys@263@01) && Lookup(f, First:($t@265@01), x1@274@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x1@274@01) in xs@262@01) && x2@275@01 in xs@262@01 && !(x2@275@01 in ys@263@01) && Lookup(f, First:($t@265@01), x2@275@01) != 0 && !(Lookup(g, First:(Second:($t@265@01)), x2@275@01) in xs@262@01) && x1@274@01 != x2@275@01)]
(assert (not
  (and
    (Set_in x1@274@01 xs@262@01)
    (and
      (not (Set_in x1@274@01 ys@263@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
          (and
            (Set_in x2@275@01 xs@262@01)
            (and
              (not (Set_in x2@275@01 ys@263@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                  (not (= x1@274@01 x2@275@01))))))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x1@274@01 xs@262@01)
    (and
      (not (Set_in x1@274@01 ys@263@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
          (and
            (Set_in x2@275@01 xs@262@01)
            (and
              (not (Set_in x2@275@01 ys@263@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                  (not (= x1@274@01 x2@275@01))))))))))
  (and
    (Set_in x1@274@01 xs@262@01)
    (not (Set_in x1@274@01 ys@263@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
    (Set_in x2@275@01 xs@262@01)
    (not (Set_in x2@275@01 ys@263@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
    (not (= x1@274@01 x2@275@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x1@274@01 xs@262@01)
      (and
        (not (Set_in x1@274@01 ys@263@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
            (and
              (Set_in x2@275@01 xs@262@01)
              (and
                (not (Set_in x2@275@01 ys@263@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                    (not (= x1@274@01 x2@275@01)))))))))))
  (and
    (Set_in x1@274@01 xs@262@01)
    (and
      (not (Set_in x1@274@01 ys@263@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
          (and
            (Set_in x2@275@01 xs@262@01)
            (and
              (not (Set_in x2@275@01 ys@263@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                  (not (= x1@274@01 x2@275@01))))))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in x1@274@01 xs@262@01) (Set_in x2@275@01 xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in x1@274@01 xs@262@01) (Set_in x2@275@01 ys@263@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in x1@274@01 xs@262@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in x1@274@01 ys@263@01) (Set_in x2@275@01 xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in x1@274@01 ys@263@01) (Set_in x2@275@01 ys@263@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in x1@274@01 ys@263@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01) (Set_in x2@275@01 xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01) (Set_in x2@275@01 ys@263@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@274@01 xs@262@01)
      (and
        (Set_in x1@274@01 xs@262@01)
        (=>
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                    (=>
                      (Set_in x2@275@01 xs@262@01)
                      (and
                        (Set_in x2@275@01 xs@262@01)
                        (=>
                          (not (Set_in x2@275@01 ys@263@01))
                          (and
                            (not (Set_in x2@275@01 ys@263@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                                0))))
                        (or
                          (not (Set_in x2@275@01 ys@263@01))
                          (Set_in x2@275@01 ys@263@01))))
                    (or
                      (Set_in x2@275@01 xs@262@01)
                      (not (Set_in x2@275@01 xs@262@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))))
        (or (not (Set_in x1@274@01 ys@263@01)) (Set_in x1@274@01 ys@263@01))))
    (or (Set_in x1@274@01 xs@262@01) (not (Set_in x1@274@01 xs@262@01)))
    (=>
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (not (Set_in x1@274@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
        (Set_in x2@275@01 xs@262@01)
        (not (Set_in x2@275@01 ys@263@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
        (not (= x1@274@01 x2@275@01))))
    (or
      (not
        (and
          (Set_in x1@274@01 xs@262@01)
          (and
            (not (Set_in x1@274@01 ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
                (and
                  (Set_in x2@275@01 xs@262@01)
                  (and
                    (not (Set_in x2@275@01 ys@263@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                        (not (= x1@274@01 x2@275@01)))))))))))
      (and
        (Set_in x1@274@01 xs@262@01)
        (and
          (not (Set_in x1@274@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
              (and
                (Set_in x2@275@01 xs@262@01)
                (and
                  (not (Set_in x2@275@01 ys@263@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                      (not (= x1@274@01 x2@275@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@274@01 $Ref) (x2@275@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@274@01 xs@262@01)
      (and
        (not (Set_in x1@274@01 ys@263@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@274@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01))
            (and
              (Set_in x2@275@01 xs@262@01)
              (and
                (not (Set_in x2@275@01 ys@263@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@275@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
                    (not (= x1@274@01 x2@275@01))))))))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01))))
  :pattern ((Set_in x1@274@01 xs@262@01) (Set_in x2@275@01 xs@262@01))
  :pattern ((Set_in x1@274@01 xs@262@01) (Set_in x2@275@01 ys@263@01))
  :pattern ((Set_in x1@274@01 xs@262@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  :pattern ((Set_in x1@274@01 ys@263@01) (Set_in x2@275@01 xs@262@01))
  :pattern ((Set_in x1@274@01 ys@263@01) (Set_in x2@275@01 ys@263@01))
  :pattern ((Set_in x1@274@01 ys@263@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01) (Set_in x2@275@01 xs@262@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01) (Set_in x2@275@01 ys@263@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@274@01) xs@262@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@275@01) xs@262@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92|)))
(declare-const x@276@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 33 | !(x@276@01 in xs@262@01) | live]
; [else-branch: 33 | x@276@01 in xs@262@01 | live]
(push) ; 5
; [then-branch: 33 | !(x@276@01 in xs@262@01)]
(assert (not (Set_in x@276@01 xs@262@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | x@276@01 in xs@262@01]
(assert (Set_in x@276@01 xs@262@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 34 | x@276@01 in ys@263@01 | live]
; [else-branch: 34 | !(x@276@01 in ys@263@01) | live]
(push) ; 7
; [then-branch: 34 | x@276@01 in ys@263@01]
(assert (Set_in x@276@01 ys@263@01))
(pop) ; 7
(push) ; 7
; [else-branch: 34 | !(x@276@01 in ys@263@01)]
(assert (not (Set_in x@276@01 ys@263@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@270@01 x@276@01)
  (and
    (Set_in (inv@269@01 x@276@01) xs@262@01)
    (not (Set_in (inv@269@01 x@276@01) ys@263@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 35 | Lookup(f, First:($t@265@01), x@276@01) == 0 | live]
; [else-branch: 35 | Lookup(f, First:($t@265@01), x@276@01) != 0 | live]
(push) ; 9
; [then-branch: 35 | Lookup(f, First:($t@265@01), x@276@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 35 | Lookup(f, First:($t@265@01), x@276@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
    0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(push) ; 10
(assert (not (and
  (img@273@01 x@276@01)
  (and
    (Set_in (inv@272@01 x@276@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x@276@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x@276@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x@276@01 ys@263@01))
  (and
    (not (Set_in x@276@01 ys@263@01))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
        0)))))
(assert (or (not (Set_in x@276@01 ys@263@01)) (Set_in x@276@01 ys@263@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@276@01 xs@262@01)
  (and
    (Set_in x@276@01 xs@262@01)
    (=>
      (not (Set_in x@276@01 ys@263@01))
      (and
        (not (Set_in x@276@01 ys@263@01))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
            0))))
    (or (not (Set_in x@276@01 ys@263@01)) (Set_in x@276@01 ys@263@01)))))
(assert (or (Set_in x@276@01 xs@262@01) (not (Set_in x@276@01 xs@262@01))))
(assert (and
  (Set_in x@276@01 xs@262@01)
  (and
    (not (Set_in x@276@01 ys@263@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
          0))
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01) xs@262@01))))))
(push) ; 4
(assert (not (and
  (img@273@01 x@276@01)
  (and
    (Set_in (inv@272@01 x@276@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x@276@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x@276@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@277@01 ($Ref) $Ref)
(declare-fun img@278@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@276@01 $Ref)) (!
  (=>
    (and
      (Set_in x@276@01 xs@262@01)
      (and
        (not (Set_in x@276@01 ys@263@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01) xs@262@01)))))
    (and
      (=>
        (Set_in x@276@01 xs@262@01)
        (and
          (Set_in x@276@01 xs@262@01)
          (=>
            (not (Set_in x@276@01 ys@263@01))
            (and
              (not (Set_in x@276@01 ys@263@01))
              (or
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
                    0))
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
                  0))))
          (or (not (Set_in x@276@01 ys@263@01)) (Set_in x@276@01 ys@263@01))))
      (or (Set_in x@276@01 xs@262@01) (not (Set_in x@276@01 xs@262@01)))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@276@01 $Ref) (x2@276@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@276@01 xs@262@01)
        (and
          (not (Set_in x1@276@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x1@276@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@276@01) xs@262@01)))))
      (and
        (Set_in x2@276@01 xs@262@01)
        (and
          (not (Set_in x2@276@01 ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x2@276@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@276@01) xs@262@01)))))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x1@276@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x2@276@01)))
    (= x1@276@01 x2@276@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@276@01 $Ref)) (!
  (=>
    (and
      (Set_in x@276@01 xs@262@01)
      (and
        (not (Set_in x@276@01 ys@263@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01) xs@262@01)))))
    (and
      (=
        (inv@277@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01))
        x@276@01)
      (img@278@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01))
  :qid |quant-u-83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@278@01 r)
      (and
        (Set_in (inv@277@01 r) xs@262@01)
        (and
          (not (Set_in (inv@277@01 r) ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@277@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) (inv@277@01 r)) xs@262@01))))))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) (inv@277@01 r))
      r))
  :pattern ((inv@277@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@276@01 $Ref)) (!
  (=>
    (and
      (Set_in x@276@01 xs@262@01)
      (and
        (not (Set_in x@276@01 ys@263@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) x@276@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01) xs@262@01)))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) x@276@01)
      x@268@01)
    (=
      (and
        (img@278@01 r)
        (and
          (Set_in (inv@277@01 r) xs@262@01)
          (and
            (not (Set_in (inv@277@01 r) ys@263@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@277@01 r))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) (inv@277@01 r)) xs@262@01))))))
      (and
        (img@270@01 r)
        (and
          (Set_in (inv@269@01 r) xs@262@01)
          (not (Set_in (inv@269@01 r) ys@263@01))))))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@265@01 xs@262@01 ys@263@01))
; [exec]
; inhale (x in xs)
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@264@01 xs@262@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !((x in ys))
(declare-const $t@280@01 $Snap)
(assert (= $t@280@01 $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@264@01 ys@263@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@281@01 $Snap)
(assert (= $t@281@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@264@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@282@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@270@01 r)
      (and
        (Set_in (inv@269@01 r) xs@262@01)
        (not (Set_in (inv@269@01 r) ys@263@01))))
    (=
      ($FVF.lookup_f (as sm@282@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) r)))
  :pattern (($FVF.lookup_f (as sm@282@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@278@01 r)
      (and
        (Set_in (inv@277@01 r) xs@262@01)
        (and
          (not (Set_in (inv@277@01 r) ys@263@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@277@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) (inv@277@01 r)) xs@262@01))))))
    (=
      ($FVF.lookup_f (as sm@282@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@265@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@282@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@265@01)))) r))
  :qid |qp.fvfValDef83|)))
(declare-const pm@283@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@283@01  $FPM) r)
    (+
      (ite
        (and
          (img@270@01 r)
          (and
            (Set_in (inv@269@01 r) xs@262@01)
            (not (Set_in (inv@269@01 r) ys@263@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@278@01 r)
          (and
            (Set_in (inv@277@01 r) xs@262@01)
            (and
              (not (Set_in (inv@277@01 r) ys@263@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@277@01 r))
                    0))
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@265@01))) (inv@277@01 r)) xs@262@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@283@01  $FPM) r))
  :qid |qp.resPrmSumDef84|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@283@01  $FPM) x@264@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@284@01 Int)
(assert (= a@284@01 ($FVF.lookup_f (as sm@282@01  $FVF<f>) x@264@01)))
; [exec]
; b := x.g
(push) ; 3
(assert (not (and
  (img@273@01 x@264@01)
  (and
    (Set_in (inv@272@01 x@264@01) xs@262@01)
    (and
      (not (Set_in (inv@272@01 x@264@01) ys@263@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@265@01)) (inv@272@01 x@264@01))
          0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@285@01 Set<$Ref>)
(declare-const ys@286@01 Set<$Ref>)
(declare-const x@287@01 $Ref)
(declare-const xs@288@01 Set<$Ref>)
(declare-const ys@289@01 Set<$Ref>)
(declare-const x@290@01 $Ref)
(push) ; 1
(declare-const $t@291@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@292@01 Int)
; [exec]
; var b: Ref
(declare-const b@293@01 $Ref)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@291@01 ($Snap.combine ($Snap.first $t@291@01) ($Snap.second $t@291@01))))
(declare-const x@294@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 36 | !(x@294@01 in xs@288@01) | live]
; [else-branch: 36 | x@294@01 in xs@288@01 | live]
(push) ; 5
; [then-branch: 36 | !(x@294@01 in xs@288@01)]
(assert (not (Set_in x@294@01 xs@288@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | x@294@01 in xs@288@01]
(assert (Set_in x@294@01 xs@288@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@294@01 xs@288@01) (not (Set_in x@294@01 xs@288@01))))
(assert (and (Set_in x@294@01 xs@288@01) (not (Set_in x@294@01 ys@289@01))))
(pop) ; 3
(declare-fun inv@295@01 ($Ref) $Ref)
(declare-fun img@296@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@294@01 $Ref)) (!
  (=>
    (and (Set_in x@294@01 xs@288@01) (not (Set_in x@294@01 ys@289@01)))
    (or (Set_in x@294@01 xs@288@01) (not (Set_in x@294@01 xs@288@01))))
  :pattern ((Set_in x@294@01 xs@288@01))
  :pattern ((Set_in x@294@01 ys@289@01))
  :pattern ((inv@295@01 x@294@01))
  :pattern ((img@296@01 x@294@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@294@01 $Ref) (x2@294@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@294@01 xs@288@01) (not (Set_in x1@294@01 ys@289@01)))
      (and (Set_in x2@294@01 xs@288@01) (not (Set_in x2@294@01 ys@289@01)))
      (= x1@294@01 x2@294@01))
    (= x1@294@01 x2@294@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@294@01 $Ref)) (!
  (=>
    (and (Set_in x@294@01 xs@288@01) (not (Set_in x@294@01 ys@289@01)))
    (and (= (inv@295@01 x@294@01) x@294@01) (img@296@01 x@294@01)))
  :pattern ((Set_in x@294@01 xs@288@01))
  :pattern ((Set_in x@294@01 ys@289@01))
  :pattern ((inv@295@01 x@294@01))
  :pattern ((img@296@01 x@294@01))
  :qid |quant-u-86|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@296@01 r)
      (and
        (Set_in (inv@295@01 r) xs@288@01)
        (not (Set_in (inv@295@01 r) ys@289@01))))
    (= (inv@295@01 r) r))
  :pattern ((inv@295@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@294@01 $Ref)) (!
  (=>
    (and (Set_in x@294@01 xs@288@01) (not (Set_in x@294@01 ys@289@01)))
    (not (= x@294@01 $Ref.null)))
  :pattern ((Set_in x@294@01 xs@288@01))
  :pattern ((Set_in x@294@01 ys@289@01))
  :pattern ((inv@295@01 x@294@01))
  :pattern ((img@296@01 x@294@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@291@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@291@01))
    ($Snap.second ($Snap.second $t@291@01)))))
(declare-const x@297@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 37 | !(x@297@01 in xs@288@01) | live]
; [else-branch: 37 | x@297@01 in xs@288@01 | live]
(push) ; 5
; [then-branch: 37 | !(x@297@01 in xs@288@01)]
(assert (not (Set_in x@297@01 xs@288@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 37 | x@297@01 in xs@288@01]
(assert (Set_in x@297@01 xs@288@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 38 | x@297@01 in ys@289@01 | live]
; [else-branch: 38 | !(x@297@01 in ys@289@01) | live]
(push) ; 7
; [then-branch: 38 | x@297@01 in ys@289@01]
(assert (Set_in x@297@01 ys@289@01))
(pop) ; 7
(push) ; 7
; [else-branch: 38 | !(x@297@01 in ys@289@01)]
(assert (not (Set_in x@297@01 ys@289@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@296@01 x@297@01)
  (and
    (Set_in (inv@295@01 x@297@01) xs@288@01)
    (not (Set_in (inv@295@01 x@297@01) ys@289@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@297@01 ys@289@01)) (Set_in x@297@01 ys@289@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@297@01 xs@288@01)
  (and
    (Set_in x@297@01 xs@288@01)
    (or (not (Set_in x@297@01 ys@289@01)) (Set_in x@297@01 ys@289@01)))))
(assert (or (Set_in x@297@01 xs@288@01) (not (Set_in x@297@01 xs@288@01))))
(assert (and
  (Set_in x@297@01 xs@288@01)
  (and
    (not (Set_in x@297@01 ys@289@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01)
        0)))))
(pop) ; 3
(declare-fun inv@298@01 ($Ref) $Ref)
(declare-fun img@299@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@297@01 $Ref)) (!
  (=>
    (and
      (Set_in x@297@01 xs@288@01)
      (and
        (not (Set_in x@297@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01)
            0))))
    (and
      (=>
        (Set_in x@297@01 xs@288@01)
        (and
          (Set_in x@297@01 xs@288@01)
          (or (not (Set_in x@297@01 ys@289@01)) (Set_in x@297@01 ys@289@01))))
      (or (Set_in x@297@01 xs@288@01) (not (Set_in x@297@01 xs@288@01)))))
  :pattern ((Set_in x@297@01 xs@288@01))
  :pattern ((Set_in x@297@01 ys@289@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01))
  :pattern ((inv@298@01 x@297@01))
  :pattern ((img@299@01 x@297@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@297@01 $Ref) (x2@297@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@297@01 xs@288@01)
        (and
          (not (Set_in x1@297@01 ys@289@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@297@01)
              0))))
      (and
        (Set_in x2@297@01 xs@288@01)
        (and
          (not (Set_in x2@297@01 ys@289@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@297@01)
              0))))
      (= x1@297@01 x2@297@01))
    (= x1@297@01 x2@297@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@297@01 $Ref)) (!
  (=>
    (and
      (Set_in x@297@01 xs@288@01)
      (and
        (not (Set_in x@297@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01)
            0))))
    (and (= (inv@298@01 x@297@01) x@297@01) (img@299@01 x@297@01)))
  :pattern ((Set_in x@297@01 xs@288@01))
  :pattern ((Set_in x@297@01 ys@289@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01))
  :pattern ((inv@298@01 x@297@01))
  :pattern ((img@299@01 x@297@01))
  :qid |quant-u-88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@299@01 r)
      (and
        (Set_in (inv@298@01 r) xs@288@01)
        (and
          (not (Set_in (inv@298@01 r) ys@289@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 r))
              0)))))
    (= (inv@298@01 r) r))
  :pattern ((inv@298@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@297@01 $Ref)) (!
  (=>
    (and
      (Set_in x@297@01 xs@288@01)
      (and
        (not (Set_in x@297@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01)
            0))))
    (not (= x@297@01 $Ref.null)))
  :pattern ((Set_in x@297@01 xs@288@01))
  :pattern ((Set_in x@297@01 ys@289@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@297@01))
  :pattern ((inv@298@01 x@297@01))
  :pattern ((img@299@01 x@297@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@291@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@291@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@291@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@291@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@300@01 $Ref)
(declare-const x2@301@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 39 | !(x1@300@01 in xs@288@01) | live]
; [else-branch: 39 | x1@300@01 in xs@288@01 | live]
(push) ; 5
; [then-branch: 39 | !(x1@300@01 in xs@288@01)]
(assert (not (Set_in x1@300@01 xs@288@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | x1@300@01 in xs@288@01]
(assert (Set_in x1@300@01 xs@288@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 40 | x1@300@01 in ys@289@01 | live]
; [else-branch: 40 | !(x1@300@01 in ys@289@01) | live]
(push) ; 7
; [then-branch: 40 | x1@300@01 in ys@289@01]
(assert (Set_in x1@300@01 ys@289@01))
(pop) ; 7
(push) ; 7
; [else-branch: 40 | !(x1@300@01 in ys@289@01)]
(assert (not (Set_in x1@300@01 ys@289@01)))
; [eval] x1.f != 0
(push) ; 8
(assert (not (and
  (img@296@01 x1@300@01)
  (and
    (Set_in (inv@295@01 x1@300@01) xs@288@01)
    (not (Set_in (inv@295@01 x1@300@01) ys@289@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 41 | Lookup(f, First:($t@291@01), x1@300@01) == 0 | live]
; [else-branch: 41 | Lookup(f, First:($t@291@01), x1@300@01) != 0 | live]
(push) ; 9
; [then-branch: 41 | Lookup(f, First:($t@291@01), x1@300@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 41 | Lookup(f, First:($t@291@01), x1@300@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
    0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(push) ; 10
(assert (not (and
  (img@299@01 x1@300@01)
  (and
    (Set_in (inv@298@01 x1@300@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x1@300@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x1@300@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 42 | Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01 | live]
; [else-branch: 42 | !(Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01) | live]
(push) ; 11
; [then-branch: 42 | Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
(pop) ; 11
(push) ; 11
; [else-branch: 42 | !(Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 43 | !(x2@301@01 in xs@288@01) | live]
; [else-branch: 43 | x2@301@01 in xs@288@01 | live]
(push) ; 13
; [then-branch: 43 | !(x2@301@01 in xs@288@01)]
(assert (not (Set_in x2@301@01 xs@288@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 43 | x2@301@01 in xs@288@01]
(assert (Set_in x2@301@01 xs@288@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 44 | x2@301@01 in ys@289@01 | live]
; [else-branch: 44 | !(x2@301@01 in ys@289@01) | live]
(push) ; 15
; [then-branch: 44 | x2@301@01 in ys@289@01]
(assert (Set_in x2@301@01 ys@289@01))
(pop) ; 15
(push) ; 15
; [else-branch: 44 | !(x2@301@01 in ys@289@01)]
(assert (not (Set_in x2@301@01 ys@289@01)))
; [eval] x2.f != 0
(push) ; 16
(assert (not (and
  (img@296@01 x2@301@01)
  (and
    (Set_in (inv@295@01 x2@301@01) xs@288@01)
    (not (Set_in (inv@295@01 x2@301@01) ys@289@01))))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 45 | Lookup(f, First:($t@291@01), x2@301@01) == 0 | live]
; [else-branch: 45 | Lookup(f, First:($t@291@01), x2@301@01) != 0 | live]
(push) ; 17
; [then-branch: 45 | Lookup(f, First:($t@291@01), x2@301@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
  0))
(pop) ; 17
(push) ; 17
; [else-branch: 45 | Lookup(f, First:($t@291@01), x2@301@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
    0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(push) ; 18
(assert (not (and
  (img@299@01 x2@301@01)
  (and
    (Set_in (inv@298@01 x2@301@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x2@301@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x2@301@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 46 | Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01 | live]
; [else-branch: 46 | !(Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01) | live]
(push) ; 19
; [then-branch: 46 | Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
(pop) ; 19
(push) ; 19
; [else-branch: 46 | !(Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01)))
; [eval] x1 != x2
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
        0))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
    0)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x2@301@01 ys@289@01))
  (and
    (not (Set_in x2@301@01 ys@289@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
        0)))))
(assert (or (not (Set_in x2@301@01 ys@289@01)) (Set_in x2@301@01 ys@289@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x2@301@01 xs@288@01)
  (and
    (Set_in x2@301@01 xs@288@01)
    (=>
      (not (Set_in x2@301@01 ys@289@01))
      (and
        (not (Set_in x2@301@01 ys@289@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                0))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))))
    (or (not (Set_in x2@301@01 ys@289@01)) (Set_in x2@301@01 ys@289@01)))))
(assert (or (Set_in x2@301@01 xs@288@01) (not (Set_in x2@301@01 xs@288@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
  (and
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
    (=>
      (Set_in x2@301@01 xs@288@01)
      (and
        (Set_in x2@301@01 xs@288@01)
        (=>
          (not (Set_in x2@301@01 ys@289@01))
          (and
            (not (Set_in x2@301@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                    0))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                0))))
        (or (not (Set_in x2@301@01 ys@289@01)) (Set_in x2@301@01 ys@289@01))))
    (or (Set_in x2@301@01 xs@288@01) (not (Set_in x2@301@01 xs@288@01))))))
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
        0))
    (=>
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (=>
          (Set_in x2@301@01 xs@288@01)
          (and
            (Set_in x2@301@01 xs@288@01)
            (=>
              (not (Set_in x2@301@01 ys@289@01))
              (and
                (not (Set_in x2@301@01 ys@289@01))
                (=>
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                      0))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (or
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                (or
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                      0))
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                    0))))
            (or (not (Set_in x2@301@01 ys@289@01)) (Set_in x2@301@01 ys@289@01))))
        (or (Set_in x2@301@01 xs@288@01) (not (Set_in x2@301@01 xs@288@01)))))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x1@300@01 ys@289@01))
  (and
    (not (Set_in x1@300@01 ys@289@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (=>
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
            (=>
              (Set_in x2@301@01 xs@288@01)
              (and
                (Set_in x2@301@01 xs@288@01)
                (=>
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (=>
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                            0))
                        (or
                          (not
                            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                    (or
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))))
                (or
                  (not (Set_in x2@301@01 ys@289@01))
                  (Set_in x2@301@01 ys@289@01))))
            (or (Set_in x2@301@01 xs@288@01) (not (Set_in x2@301@01 xs@288@01)))))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
        0)))))
(assert (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x1@300@01 xs@288@01)
  (and
    (Set_in x1@300@01 xs@288@01)
    (=>
      (not (Set_in x1@300@01 ys@289@01))
      (and
        (not (Set_in x1@300@01 ys@289@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (=>
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (=>
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (Set_in x2@301@01 xs@288@01)
                    (=>
                      (not (Set_in x2@301@01 ys@289@01))
                      (and
                        (not (Set_in x2@301@01 ys@289@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))
                            (or
                              (not
                                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                        (or
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                              0))
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                            0))))
                    (or
                      (not (Set_in x2@301@01 ys@289@01))
                      (Set_in x2@301@01 ys@289@01))))
                (or
                  (Set_in x2@301@01 xs@288@01)
                  (not (Set_in x2@301@01 xs@288@01)))))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))))
    (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01)))))
(assert (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01))))
(push) ; 4
; [then-branch: 47 | x1@300@01 in xs@288@01 && !(x1@300@01 in ys@289@01) && Lookup(f, First:($t@291@01), x1@300@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01) && x2@301@01 in xs@288@01 && !(x2@301@01 in ys@289@01) && Lookup(f, First:($t@291@01), x2@301@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01) && x1@300@01 != x2@301@01 | live]
; [else-branch: 47 | !(x1@300@01 in xs@288@01 && !(x1@300@01 in ys@289@01) && Lookup(f, First:($t@291@01), x1@300@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01) && x2@301@01 in xs@288@01 && !(x2@301@01 in ys@289@01) && Lookup(f, First:($t@291@01), x2@301@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01) && x1@300@01 != x2@301@01) | live]
(push) ; 5
; [then-branch: 47 | x1@300@01 in xs@288@01 && !(x1@300@01 in ys@289@01) && Lookup(f, First:($t@291@01), x1@300@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01) && x2@301@01 in xs@288@01 && !(x2@301@01 in ys@289@01) && Lookup(f, First:($t@291@01), x2@301@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01) && x1@300@01 != x2@301@01]
(assert (and
  (Set_in x1@300@01 xs@288@01)
  (and
    (not (Set_in x1@300@01 ys@289@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
          0))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (and
          (Set_in x2@301@01 xs@288@01)
          (and
            (not (Set_in x2@301@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                (not (= x1@300@01 x2@301@01)))))))))))
; [eval] x1.g != x2.g
(push) ; 6
(assert (not (and
  (img@299@01 x1@300@01)
  (and
    (Set_in (inv@298@01 x1@300@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x1@300@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x1@300@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@299@01 x2@301@01)
  (and
    (Set_in (inv@298@01 x2@301@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x2@301@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x2@301@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 47 | !(x1@300@01 in xs@288@01 && !(x1@300@01 in ys@289@01) && Lookup(f, First:($t@291@01), x1@300@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x1@300@01) in xs@288@01) && x2@301@01 in xs@288@01 && !(x2@301@01 in ys@289@01) && Lookup(f, First:($t@291@01), x2@301@01) != 0 && !(Lookup(g, First:(Second:($t@291@01)), x2@301@01) in xs@288@01) && x1@300@01 != x2@301@01)]
(assert (not
  (and
    (Set_in x1@300@01 xs@288@01)
    (and
      (not (Set_in x1@300@01 ys@289@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
          (and
            (Set_in x2@301@01 xs@288@01)
            (and
              (not (Set_in x2@301@01 ys@289@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                  (not (= x1@300@01 x2@301@01))))))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x1@300@01 xs@288@01)
    (and
      (not (Set_in x1@300@01 ys@289@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
          (and
            (Set_in x2@301@01 xs@288@01)
            (and
              (not (Set_in x2@301@01 ys@289@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                  (not (= x1@300@01 x2@301@01))))))))))
  (and
    (Set_in x1@300@01 xs@288@01)
    (not (Set_in x1@300@01 ys@289@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
    (Set_in x2@301@01 xs@288@01)
    (not (Set_in x2@301@01 ys@289@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
    (not (= x1@300@01 x2@301@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x1@300@01 xs@288@01)
      (and
        (not (Set_in x1@300@01 ys@289@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
            (and
              (Set_in x2@301@01 xs@288@01)
              (and
                (not (Set_in x2@301@01 ys@289@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                    (not (= x1@300@01 x2@301@01)))))))))))
  (and
    (Set_in x1@300@01 xs@288@01)
    (and
      (not (Set_in x1@300@01 ys@289@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
          (and
            (Set_in x2@301@01 xs@288@01)
            (and
              (not (Set_in x2@301@01 ys@289@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                  (not (= x1@300@01 x2@301@01))))))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in x1@300@01 xs@288@01) (Set_in x2@301@01 xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in x1@300@01 xs@288@01) (Set_in x2@301@01 ys@289@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in x1@300@01 xs@288@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in x1@300@01 ys@289@01) (Set_in x2@301@01 xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in x1@300@01 ys@289@01) (Set_in x2@301@01 ys@289@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in x1@300@01 ys@289@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01) (Set_in x2@301@01 xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01) (Set_in x2@301@01 ys@289@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@300@01 xs@288@01)
      (and
        (Set_in x1@300@01 xs@288@01)
        (=>
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                    (=>
                      (Set_in x2@301@01 xs@288@01)
                      (and
                        (Set_in x2@301@01 xs@288@01)
                        (=>
                          (not (Set_in x2@301@01 ys@289@01))
                          (and
                            (not (Set_in x2@301@01 ys@289@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                                0))))
                        (or
                          (not (Set_in x2@301@01 ys@289@01))
                          (Set_in x2@301@01 ys@289@01))))
                    (or
                      (Set_in x2@301@01 xs@288@01)
                      (not (Set_in x2@301@01 xs@288@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))))
        (or (not (Set_in x1@300@01 ys@289@01)) (Set_in x1@300@01 ys@289@01))))
    (or (Set_in x1@300@01 xs@288@01) (not (Set_in x1@300@01 xs@288@01)))
    (=>
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (not (Set_in x1@300@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
        (Set_in x2@301@01 xs@288@01)
        (not (Set_in x2@301@01 ys@289@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
        (not (= x1@300@01 x2@301@01))))
    (or
      (not
        (and
          (Set_in x1@300@01 xs@288@01)
          (and
            (not (Set_in x1@300@01 ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
                (and
                  (Set_in x2@301@01 xs@288@01)
                  (and
                    (not (Set_in x2@301@01 ys@289@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                        (not (= x1@300@01 x2@301@01)))))))))))
      (and
        (Set_in x1@300@01 xs@288@01)
        (and
          (not (Set_in x1@300@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
              (and
                (Set_in x2@301@01 xs@288@01)
                (and
                  (not (Set_in x2@301@01 ys@289@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                      (not (= x1@300@01 x2@301@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@300@01 $Ref) (x2@301@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@300@01 xs@288@01)
      (and
        (not (Set_in x1@300@01 ys@289@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@300@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01))
            (and
              (Set_in x2@301@01 xs@288@01)
              (and
                (not (Set_in x2@301@01 ys@289@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@301@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
                    (not (= x1@300@01 x2@301@01))))))))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01))))
  :pattern ((Set_in x1@300@01 xs@288@01) (Set_in x2@301@01 xs@288@01))
  :pattern ((Set_in x1@300@01 xs@288@01) (Set_in x2@301@01 ys@289@01))
  :pattern ((Set_in x1@300@01 xs@288@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  :pattern ((Set_in x1@300@01 ys@289@01) (Set_in x2@301@01 xs@288@01))
  :pattern ((Set_in x1@300@01 ys@289@01) (Set_in x2@301@01 ys@289@01))
  :pattern ((Set_in x1@300@01 ys@289@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01) (Set_in x2@301@01 xs@288@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01) (Set_in x2@301@01 ys@289@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@300@01) xs@288@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@301@01) xs@288@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92|)))
(declare-const x@302@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 48 | !(x@302@01 in xs@288@01) | live]
; [else-branch: 48 | x@302@01 in xs@288@01 | live]
(push) ; 5
; [then-branch: 48 | !(x@302@01 in xs@288@01)]
(assert (not (Set_in x@302@01 xs@288@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | x@302@01 in xs@288@01]
(assert (Set_in x@302@01 xs@288@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 49 | x@302@01 in ys@289@01 | live]
; [else-branch: 49 | !(x@302@01 in ys@289@01) | live]
(push) ; 7
; [then-branch: 49 | x@302@01 in ys@289@01]
(assert (Set_in x@302@01 ys@289@01))
(pop) ; 7
(push) ; 7
; [else-branch: 49 | !(x@302@01 in ys@289@01)]
(assert (not (Set_in x@302@01 ys@289@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@296@01 x@302@01)
  (and
    (Set_in (inv@295@01 x@302@01) xs@288@01)
    (not (Set_in (inv@295@01 x@302@01) ys@289@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 50 | Lookup(f, First:($t@291@01), x@302@01) == 0 | live]
; [else-branch: 50 | Lookup(f, First:($t@291@01), x@302@01) != 0 | live]
(push) ; 9
; [then-branch: 50 | Lookup(f, First:($t@291@01), x@302@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 50 | Lookup(f, First:($t@291@01), x@302@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
    0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(push) ; 10
(assert (not (and
  (img@299@01 x@302@01)
  (and
    (Set_in (inv@298@01 x@302@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x@302@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x@302@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x@302@01 ys@289@01))
  (and
    (not (Set_in x@302@01 ys@289@01))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
        0)))))
(assert (or (not (Set_in x@302@01 ys@289@01)) (Set_in x@302@01 ys@289@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@302@01 xs@288@01)
  (and
    (Set_in x@302@01 xs@288@01)
    (=>
      (not (Set_in x@302@01 ys@289@01))
      (and
        (not (Set_in x@302@01 ys@289@01))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
            0))))
    (or (not (Set_in x@302@01 ys@289@01)) (Set_in x@302@01 ys@289@01)))))
(assert (or (Set_in x@302@01 xs@288@01) (not (Set_in x@302@01 xs@288@01))))
(assert (and
  (Set_in x@302@01 xs@288@01)
  (and
    (not (Set_in x@302@01 ys@289@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
          0))
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01) xs@288@01))))))
(push) ; 4
(assert (not (and
  (img@299@01 x@302@01)
  (and
    (Set_in (inv@298@01 x@302@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x@302@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x@302@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@303@01 ($Ref) $Ref)
(declare-fun img@304@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@302@01 $Ref)) (!
  (=>
    (and
      (Set_in x@302@01 xs@288@01)
      (and
        (not (Set_in x@302@01 ys@289@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01) xs@288@01)))))
    (and
      (=>
        (Set_in x@302@01 xs@288@01)
        (and
          (Set_in x@302@01 xs@288@01)
          (=>
            (not (Set_in x@302@01 ys@289@01))
            (and
              (not (Set_in x@302@01 ys@289@01))
              (or
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
                    0))
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
                  0))))
          (or (not (Set_in x@302@01 ys@289@01)) (Set_in x@302@01 ys@289@01))))
      (or (Set_in x@302@01 xs@288@01) (not (Set_in x@302@01 xs@288@01)))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@302@01 $Ref) (x2@302@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@302@01 xs@288@01)
        (and
          (not (Set_in x1@302@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x1@302@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@302@01) xs@288@01)))))
      (and
        (Set_in x2@302@01 xs@288@01)
        (and
          (not (Set_in x2@302@01 ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x2@302@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@302@01) xs@288@01)))))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x1@302@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x2@302@01)))
    (= x1@302@01 x2@302@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@302@01 $Ref)) (!
  (=>
    (and
      (Set_in x@302@01 xs@288@01)
      (and
        (not (Set_in x@302@01 ys@289@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01) xs@288@01)))))
    (and
      (=
        (inv@303@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01))
        x@302@01)
      (img@304@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01))
  :qid |quant-u-90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@304@01 r)
      (and
        (Set_in (inv@303@01 r) xs@288@01)
        (and
          (not (Set_in (inv@303@01 r) ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@303@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 r)) xs@288@01))))))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 r))
      r))
  :pattern ((inv@303@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@302@01 $Ref)) (!
  (=>
    (and
      (Set_in x@302@01 xs@288@01)
      (and
        (not (Set_in x@302@01 ys@289@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) x@302@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01) xs@288@01)))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@302@01)
      x@294@01)
    (=
      (and
        (img@304@01 r)
        (and
          (Set_in (inv@303@01 r) xs@288@01)
          (and
            (not (Set_in (inv@303@01 r) ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@303@01 r))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 r)) xs@288@01))))))
      (and
        (img@296@01 r)
        (and
          (Set_in (inv@295@01 r) xs@288@01)
          (not (Set_in (inv@295@01 r) ys@289@01))))))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@291@01 xs@288@01 ys@289@01))
; [exec]
; inhale (x in xs)
(declare-const $t@305@01 $Snap)
(assert (= $t@305@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@290@01 xs@288@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !((x in ys))
(declare-const $t@306@01 $Snap)
(assert (= $t@306@01 $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@290@01 ys@289@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@307@01 $Snap)
(assert (= $t@307@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@290@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@308@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@296@01 r)
      (and
        (Set_in (inv@295@01 r) xs@288@01)
        (not (Set_in (inv@295@01 r) ys@289@01))))
    (=
      ($FVF.lookup_f (as sm@308@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) r)))
  :pattern (($FVF.lookup_f (as sm@308@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@304@01 r)
      (and
        (Set_in (inv@303@01 r) xs@288@01)
        (and
          (not (Set_in (inv@303@01 r) ys@289@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@303@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 r)) xs@288@01))))))
    (=
      ($FVF.lookup_f (as sm@308@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@291@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@308@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@291@01)))) r))
  :qid |qp.fvfValDef86|)))
(declare-const pm@309@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@309@01  $FPM) r)
    (+
      (ite
        (and
          (img@296@01 r)
          (and
            (Set_in (inv@295@01 r) xs@288@01)
            (not (Set_in (inv@295@01 r) ys@289@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@304@01 r)
          (and
            (Set_in (inv@303@01 r) xs@288@01)
            (and
              (not (Set_in (inv@303@01 r) ys@289@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@303@01 r))
                    0))
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 r)) xs@288@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@309@01  $FPM) r))
  :qid |qp.resPrmSumDef87|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@309@01  $FPM) x@290@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@310@01 Int)
(assert (= a@310@01 ($FVF.lookup_f (as sm@308@01  $FVF<f>) x@290@01)))
; [exec]
; inhale a != 0
(declare-const $t@311@01 $Snap)
(assert (= $t@311@01 $Snap.unit))
; [eval] a != 0
(assert (not (= a@310@01 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b := x.g
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@299@01 x@290@01)
  (and
    (Set_in (inv@298@01 x@290@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x@290@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x@290@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const b@312@01 $Ref)
(assert (=
  b@312@01
  ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01)))
; [exec]
; a := x.g.f
(push) ; 3
(assert (not (and
  (img@299@01 x@290@01)
  (and
    (Set_in (inv@298@01 x@290@01) xs@288@01)
    (and
      (not (Set_in (inv@298@01 x@290@01) ys@289@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@298@01 x@290@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@296@01 r)
        (and
          (Set_in (inv@295@01 r) xs@288@01)
          (not (Set_in (inv@295@01 r) ys@289@01))))
      (=
        ($FVF.lookup_f (as sm@308@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) r)))
    :pattern (($FVF.lookup_f (as sm@308@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) r))
    :qid |qp.fvfValDef85|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@304@01 r)
        (and
          (Set_in (inv@303@01 r) xs@288@01)
          (and
            (not (Set_in (inv@303@01 r) ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@303@01 r))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 r)) xs@288@01))))))
      (=
        ($FVF.lookup_f (as sm@308@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@291@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@308@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@291@01)))) r))
    :qid |qp.fvfValDef86|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@296@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01))
        (and
          (Set_in (inv@295@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01)) xs@288@01)
          (not
            (Set_in (inv@295@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01)) ys@289@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@304@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01))
        (and
          (Set_in (inv@303@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01)) xs@288@01)
          (and
            (not
              (Set_in (inv@303@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01)) ys@289@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@291@01)) (inv@303@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01)))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) (inv@303@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@291@01))) x@290@01))) xs@288@01))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const xs@313@01 Set<$Ref>)
(declare-const ys@314@01 Set<$Ref>)
(declare-const x@315@01 $Ref)
(declare-const xs@316@01 Set<$Ref>)
(declare-const ys@317@01 Set<$Ref>)
(declare-const x@318@01 $Ref)
(push) ; 1
(declare-const $t@319@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@320@01 Int)
; [exec]
; var b: Ref
(declare-const b@321@01 $Ref)
; [exec]
; unfold acc(P(xs, ys), write)
(assert (= $t@319@01 ($Snap.combine ($Snap.first $t@319@01) ($Snap.second $t@319@01))))
(declare-const x@322@01 $Ref)
(push) ; 3
; [eval] (x in xs) && !((x in ys))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 51 | !(x@322@01 in xs@316@01) | live]
; [else-branch: 51 | x@322@01 in xs@316@01 | live]
(push) ; 5
; [then-branch: 51 | !(x@322@01 in xs@316@01)]
(assert (not (Set_in x@322@01 xs@316@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | x@322@01 in xs@316@01]
(assert (Set_in x@322@01 xs@316@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@322@01 xs@316@01) (not (Set_in x@322@01 xs@316@01))))
(assert (and (Set_in x@322@01 xs@316@01) (not (Set_in x@322@01 ys@317@01))))
(pop) ; 3
(declare-fun inv@323@01 ($Ref) $Ref)
(declare-fun img@324@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@322@01 $Ref)) (!
  (=>
    (and (Set_in x@322@01 xs@316@01) (not (Set_in x@322@01 ys@317@01)))
    (or (Set_in x@322@01 xs@316@01) (not (Set_in x@322@01 xs@316@01))))
  :pattern ((Set_in x@322@01 xs@316@01))
  :pattern ((Set_in x@322@01 ys@317@01))
  :pattern ((inv@323@01 x@322@01))
  :pattern ((img@324@01 x@322@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@322@01 $Ref) (x2@322@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@322@01 xs@316@01) (not (Set_in x1@322@01 ys@317@01)))
      (and (Set_in x2@322@01 xs@316@01) (not (Set_in x2@322@01 ys@317@01)))
      (= x1@322@01 x2@322@01))
    (= x1@322@01 x2@322@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@322@01 $Ref)) (!
  (=>
    (and (Set_in x@322@01 xs@316@01) (not (Set_in x@322@01 ys@317@01)))
    (and (= (inv@323@01 x@322@01) x@322@01) (img@324@01 x@322@01)))
  :pattern ((Set_in x@322@01 xs@316@01))
  :pattern ((Set_in x@322@01 ys@317@01))
  :pattern ((inv@323@01 x@322@01))
  :pattern ((img@324@01 x@322@01))
  :qid |quant-u-93|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@324@01 r)
      (and
        (Set_in (inv@323@01 r) xs@316@01)
        (not (Set_in (inv@323@01 r) ys@317@01))))
    (= (inv@323@01 r) r))
  :pattern ((inv@323@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@322@01 $Ref)) (!
  (=>
    (and (Set_in x@322@01 xs@316@01) (not (Set_in x@322@01 ys@317@01)))
    (not (= x@322@01 $Ref.null)))
  :pattern ((Set_in x@322@01 xs@316@01))
  :pattern ((Set_in x@322@01 ys@317@01))
  :pattern ((inv@323@01 x@322@01))
  :pattern ((img@324@01 x@322@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@319@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@319@01))
    ($Snap.second ($Snap.second $t@319@01)))))
(declare-const x@325@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && x.f != 0)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 52 | !(x@325@01 in xs@316@01) | live]
; [else-branch: 52 | x@325@01 in xs@316@01 | live]
(push) ; 5
; [then-branch: 52 | !(x@325@01 in xs@316@01)]
(assert (not (Set_in x@325@01 xs@316@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | x@325@01 in xs@316@01]
(assert (Set_in x@325@01 xs@316@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 53 | x@325@01 in ys@317@01 | live]
; [else-branch: 53 | !(x@325@01 in ys@317@01) | live]
(push) ; 7
; [then-branch: 53 | x@325@01 in ys@317@01]
(assert (Set_in x@325@01 ys@317@01))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | !(x@325@01 in ys@317@01)]
(assert (not (Set_in x@325@01 ys@317@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@324@01 x@325@01)
  (and
    (Set_in (inv@323@01 x@325@01) xs@316@01)
    (not (Set_in (inv@323@01 x@325@01) ys@317@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@325@01 ys@317@01)) (Set_in x@325@01 ys@317@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@325@01 xs@316@01)
  (and
    (Set_in x@325@01 xs@316@01)
    (or (not (Set_in x@325@01 ys@317@01)) (Set_in x@325@01 ys@317@01)))))
(assert (or (Set_in x@325@01 xs@316@01) (not (Set_in x@325@01 xs@316@01))))
(assert (and
  (Set_in x@325@01 xs@316@01)
  (and
    (not (Set_in x@325@01 ys@317@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01)
        0)))))
(pop) ; 3
(declare-fun inv@326@01 ($Ref) $Ref)
(declare-fun img@327@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@325@01 $Ref)) (!
  (=>
    (and
      (Set_in x@325@01 xs@316@01)
      (and
        (not (Set_in x@325@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01)
            0))))
    (and
      (=>
        (Set_in x@325@01 xs@316@01)
        (and
          (Set_in x@325@01 xs@316@01)
          (or (not (Set_in x@325@01 ys@317@01)) (Set_in x@325@01 ys@317@01))))
      (or (Set_in x@325@01 xs@316@01) (not (Set_in x@325@01 xs@316@01)))))
  :pattern ((Set_in x@325@01 xs@316@01))
  :pattern ((Set_in x@325@01 ys@317@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01))
  :pattern ((inv@326@01 x@325@01))
  :pattern ((img@327@01 x@325@01))
  :qid |g-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@325@01 $Ref) (x2@325@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@325@01 xs@316@01)
        (and
          (not (Set_in x1@325@01 ys@317@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@325@01)
              0))))
      (and
        (Set_in x2@325@01 xs@316@01)
        (and
          (not (Set_in x2@325@01 ys@317@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@325@01)
              0))))
      (= x1@325@01 x2@325@01))
    (= x1@325@01 x2@325@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@325@01 $Ref)) (!
  (=>
    (and
      (Set_in x@325@01 xs@316@01)
      (and
        (not (Set_in x@325@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01)
            0))))
    (and (= (inv@326@01 x@325@01) x@325@01) (img@327@01 x@325@01)))
  :pattern ((Set_in x@325@01 xs@316@01))
  :pattern ((Set_in x@325@01 ys@317@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01))
  :pattern ((inv@326@01 x@325@01))
  :pattern ((img@327@01 x@325@01))
  :qid |quant-u-95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@327@01 r)
      (and
        (Set_in (inv@326@01 r) xs@316@01)
        (and
          (not (Set_in (inv@326@01 r) ys@317@01))
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 r))
              0)))))
    (= (inv@326@01 r) r))
  :pattern ((inv@326@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@325@01 $Ref)) (!
  (=>
    (and
      (Set_in x@325@01 xs@316@01)
      (and
        (not (Set_in x@325@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01)
            0))))
    (not (= x@325@01 $Ref.null)))
  :pattern ((Set_in x@325@01 xs@316@01))
  :pattern ((Set_in x@325@01 ys@317@01))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@325@01))
  :pattern ((inv@326@01 x@325@01))
  :pattern ((img@327@01 x@325@01))
  :qid |g-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@319@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@319@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@319@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@319@01))) $Snap.unit))
; [eval] (forall x1: Ref, x2: Ref :: { (x1 in xs), (x2 in xs) } { (x1 in xs), (x2 in ys) } { (x1 in xs), (x2.g in xs) } { (x1 in ys), (x2 in xs) } { (x1 in ys), (x2 in ys) } { (x1 in ys), (x2.g in xs) } { (x1.g in xs), (x2 in xs) } { (x1.g in xs), (x2 in ys) } { (x1.g in xs), (x2.g in xs) } (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g)
(declare-const x1@328@01 $Ref)
(declare-const x2@329@01 $Ref)
(push) ; 3
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2))))))) ==> x1.g != x2.g
; [eval] (x1 in xs) && (!((x1 in ys)) && (x1.f != 0 && (!((x1.g in xs)) && ((x2 in xs) && (!((x2 in ys)) && (x2.f != 0 && (!((x2.g in xs)) && x1 != x2)))))))
; [eval] (x1 in xs)
(push) ; 4
; [then-branch: 54 | !(x1@328@01 in xs@316@01) | live]
; [else-branch: 54 | x1@328@01 in xs@316@01 | live]
(push) ; 5
; [then-branch: 54 | !(x1@328@01 in xs@316@01)]
(assert (not (Set_in x1@328@01 xs@316@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | x1@328@01 in xs@316@01]
(assert (Set_in x1@328@01 xs@316@01))
; [eval] !((x1 in ys))
; [eval] (x1 in ys)
(push) ; 6
; [then-branch: 55 | x1@328@01 in ys@317@01 | live]
; [else-branch: 55 | !(x1@328@01 in ys@317@01) | live]
(push) ; 7
; [then-branch: 55 | x1@328@01 in ys@317@01]
(assert (Set_in x1@328@01 ys@317@01))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | !(x1@328@01 in ys@317@01)]
(assert (not (Set_in x1@328@01 ys@317@01)))
; [eval] x1.f != 0
(push) ; 8
(assert (not (and
  (img@324@01 x1@328@01)
  (and
    (Set_in (inv@323@01 x1@328@01) xs@316@01)
    (not (Set_in (inv@323@01 x1@328@01) ys@317@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 56 | Lookup(f, First:($t@319@01), x1@328@01) == 0 | live]
; [else-branch: 56 | Lookup(f, First:($t@319@01), x1@328@01) != 0 | live]
(push) ; 9
; [then-branch: 56 | Lookup(f, First:($t@319@01), x1@328@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 56 | Lookup(f, First:($t@319@01), x1@328@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
    0)))
; [eval] !((x1.g in xs))
; [eval] (x1.g in xs)
(push) ; 10
(assert (not (and
  (img@327@01 x1@328@01)
  (and
    (Set_in (inv@326@01 x1@328@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x1@328@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x1@328@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
; [then-branch: 57 | Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01 | live]
; [else-branch: 57 | !(Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01) | live]
(push) ; 11
; [then-branch: 57 | Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
(pop) ; 11
(push) ; 11
; [else-branch: 57 | !(Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01)))
; [eval] (x2 in xs)
(push) ; 12
; [then-branch: 58 | !(x2@329@01 in xs@316@01) | live]
; [else-branch: 58 | x2@329@01 in xs@316@01 | live]
(push) ; 13
; [then-branch: 58 | !(x2@329@01 in xs@316@01)]
(assert (not (Set_in x2@329@01 xs@316@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 58 | x2@329@01 in xs@316@01]
(assert (Set_in x2@329@01 xs@316@01))
; [eval] !((x2 in ys))
; [eval] (x2 in ys)
(push) ; 14
; [then-branch: 59 | x2@329@01 in ys@317@01 | live]
; [else-branch: 59 | !(x2@329@01 in ys@317@01) | live]
(push) ; 15
; [then-branch: 59 | x2@329@01 in ys@317@01]
(assert (Set_in x2@329@01 ys@317@01))
(pop) ; 15
(push) ; 15
; [else-branch: 59 | !(x2@329@01 in ys@317@01)]
(assert (not (Set_in x2@329@01 ys@317@01)))
; [eval] x2.f != 0
(push) ; 16
(assert (not (and
  (img@324@01 x2@329@01)
  (and
    (Set_in (inv@323@01 x2@329@01) xs@316@01)
    (not (Set_in (inv@323@01 x2@329@01) ys@317@01))))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(push) ; 16
; [then-branch: 60 | Lookup(f, First:($t@319@01), x2@329@01) == 0 | live]
; [else-branch: 60 | Lookup(f, First:($t@319@01), x2@329@01) != 0 | live]
(push) ; 17
; [then-branch: 60 | Lookup(f, First:($t@319@01), x2@329@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
  0))
(pop) ; 17
(push) ; 17
; [else-branch: 60 | Lookup(f, First:($t@319@01), x2@329@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
    0)))
; [eval] !((x2.g in xs))
; [eval] (x2.g in xs)
(push) ; 18
(assert (not (and
  (img@327@01 x2@329@01)
  (and
    (Set_in (inv@326@01 x2@329@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x2@329@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x2@329@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(push) ; 18
; [then-branch: 61 | Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01 | live]
; [else-branch: 61 | !(Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01) | live]
(push) ; 19
; [then-branch: 61 | Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01]
(assert (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
(pop) ; 19
(push) ; 19
; [else-branch: 61 | !(Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01)]
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01)))
; [eval] x1 != x2
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
        0))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
    0)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x2@329@01 ys@317@01))
  (and
    (not (Set_in x2@329@01 ys@317@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
        0)))))
(assert (or (not (Set_in x2@329@01 ys@317@01)) (Set_in x2@329@01 ys@317@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x2@329@01 xs@316@01)
  (and
    (Set_in x2@329@01 xs@316@01)
    (=>
      (not (Set_in x2@329@01 ys@317@01))
      (and
        (not (Set_in x2@329@01 ys@317@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                0))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))))
    (or (not (Set_in x2@329@01 ys@317@01)) (Set_in x2@329@01 ys@317@01)))))
(assert (or (Set_in x2@329@01 xs@316@01) (not (Set_in x2@329@01 xs@316@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
  (and
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
    (=>
      (Set_in x2@329@01 xs@316@01)
      (and
        (Set_in x2@329@01 xs@316@01)
        (=>
          (not (Set_in x2@329@01 ys@317@01))
          (and
            (not (Set_in x2@329@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                    0))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                0))))
        (or (not (Set_in x2@329@01 ys@317@01)) (Set_in x2@329@01 ys@317@01))))
    (or (Set_in x2@329@01 xs@316@01) (not (Set_in x2@329@01 xs@316@01))))))
(assert (or
  (not
    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
      0))
  (and
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
        0))
    (=>
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (=>
          (Set_in x2@329@01 xs@316@01)
          (and
            (Set_in x2@329@01 xs@316@01)
            (=>
              (not (Set_in x2@329@01 ys@317@01))
              (and
                (not (Set_in x2@329@01 ys@317@01))
                (=>
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                      0))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (or
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                (or
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                      0))
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                    0))))
            (or (not (Set_in x2@329@01 ys@317@01)) (Set_in x2@329@01 ys@317@01))))
        (or (Set_in x2@329@01 xs@316@01) (not (Set_in x2@329@01 xs@316@01)))))
    (or
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01)))))
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x1@328@01 ys@317@01))
  (and
    (not (Set_in x1@328@01 ys@317@01))
    (=>
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
          0))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (=>
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
            (=>
              (Set_in x2@329@01 xs@316@01)
              (and
                (Set_in x2@329@01 xs@316@01)
                (=>
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (=>
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                            0))
                        (or
                          (not
                            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                    (or
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))))
                (or
                  (not (Set_in x2@329@01 ys@317@01))
                  (Set_in x2@329@01 ys@317@01))))
            (or (Set_in x2@329@01 xs@316@01) (not (Set_in x2@329@01 xs@316@01)))))
        (or
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
        0)))))
(assert (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x1@328@01 xs@316@01)
  (and
    (Set_in x1@328@01 xs@316@01)
    (=>
      (not (Set_in x1@328@01 ys@317@01))
      (and
        (not (Set_in x1@328@01 ys@317@01))
        (=>
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
              0))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (=>
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (=>
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (Set_in x2@329@01 xs@316@01)
                    (=>
                      (not (Set_in x2@329@01 ys@317@01))
                      (and
                        (not (Set_in x2@329@01 ys@317@01))
                        (=>
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                              0))
                          (and
                            (not
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))
                            (or
                              (not
                                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                        (or
                          (not
                            (=
                              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                              0))
                          (=
                            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                            0))))
                    (or
                      (not (Set_in x2@329@01 ys@317@01))
                      (Set_in x2@329@01 ys@317@01))))
                (or
                  (Set_in x2@329@01 xs@316@01)
                  (not (Set_in x2@329@01 xs@316@01)))))
            (or
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))))
    (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01)))))
(assert (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01))))
(push) ; 4
; [then-branch: 62 | x1@328@01 in xs@316@01 && !(x1@328@01 in ys@317@01) && Lookup(f, First:($t@319@01), x1@328@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01) && x2@329@01 in xs@316@01 && !(x2@329@01 in ys@317@01) && Lookup(f, First:($t@319@01), x2@329@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01) && x1@328@01 != x2@329@01 | live]
; [else-branch: 62 | !(x1@328@01 in xs@316@01 && !(x1@328@01 in ys@317@01) && Lookup(f, First:($t@319@01), x1@328@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01) && x2@329@01 in xs@316@01 && !(x2@329@01 in ys@317@01) && Lookup(f, First:($t@319@01), x2@329@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01) && x1@328@01 != x2@329@01) | live]
(push) ; 5
; [then-branch: 62 | x1@328@01 in xs@316@01 && !(x1@328@01 in ys@317@01) && Lookup(f, First:($t@319@01), x1@328@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01) && x2@329@01 in xs@316@01 && !(x2@329@01 in ys@317@01) && Lookup(f, First:($t@319@01), x2@329@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01) && x1@328@01 != x2@329@01]
(assert (and
  (Set_in x1@328@01 xs@316@01)
  (and
    (not (Set_in x1@328@01 ys@317@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
          0))
      (and
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (and
          (Set_in x2@329@01 xs@316@01)
          (and
            (not (Set_in x2@329@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                (not (= x1@328@01 x2@329@01)))))))))))
; [eval] x1.g != x2.g
(push) ; 6
(assert (not (and
  (img@327@01 x1@328@01)
  (and
    (Set_in (inv@326@01 x1@328@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x1@328@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x1@328@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@327@01 x2@329@01)
  (and
    (Set_in (inv@326@01 x2@329@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x2@329@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x2@329@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 62 | !(x1@328@01 in xs@316@01 && !(x1@328@01 in ys@317@01) && Lookup(f, First:($t@319@01), x1@328@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x1@328@01) in xs@316@01) && x2@329@01 in xs@316@01 && !(x2@329@01 in ys@317@01) && Lookup(f, First:($t@319@01), x2@329@01) != 0 && !(Lookup(g, First:(Second:($t@319@01)), x2@329@01) in xs@316@01) && x1@328@01 != x2@329@01)]
(assert (not
  (and
    (Set_in x1@328@01 xs@316@01)
    (and
      (not (Set_in x1@328@01 ys@317@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
          (and
            (Set_in x2@329@01 xs@316@01)
            (and
              (not (Set_in x2@329@01 ys@317@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                  (not (= x1@328@01 x2@329@01))))))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in x1@328@01 xs@316@01)
    (and
      (not (Set_in x1@328@01 ys@317@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
          (and
            (Set_in x2@329@01 xs@316@01)
            (and
              (not (Set_in x2@329@01 ys@317@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                  (not (= x1@328@01 x2@329@01))))))))))
  (and
    (Set_in x1@328@01 xs@316@01)
    (not (Set_in x1@328@01 ys@317@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
    (Set_in x2@329@01 xs@316@01)
    (not (Set_in x2@329@01 ys@317@01))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
        0))
    (not
      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
    (not (= x1@328@01 x2@329@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x1@328@01 xs@316@01)
      (and
        (not (Set_in x1@328@01 ys@317@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
            (and
              (Set_in x2@329@01 xs@316@01)
              (and
                (not (Set_in x2@329@01 ys@317@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                    (not (= x1@328@01 x2@329@01)))))))))))
  (and
    (Set_in x1@328@01 xs@316@01)
    (and
      (not (Set_in x1@328@01 ys@317@01))
      (and
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (and
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
          (and
            (Set_in x2@329@01 xs@316@01)
            (and
              (not (Set_in x2@329@01 ys@317@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                    0))
                (and
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                  (not (= x1@328@01 x2@329@01))))))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in x1@328@01 xs@316@01) (Set_in x2@329@01 xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in x1@328@01 xs@316@01) (Set_in x2@329@01 ys@317@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in x1@328@01 xs@316@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in x1@328@01 ys@317@01) (Set_in x2@329@01 xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in x1@328@01 ys@317@01) (Set_in x2@329@01 ys@317@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in x1@328@01 ys@317@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01) (Set_in x2@329@01 xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01) (Set_in x2@329@01 ys@317@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (and
    (=>
      (Set_in x1@328@01 xs@316@01)
      (and
        (Set_in x1@328@01 xs@316@01)
        (=>
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (=>
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                    0))
                (=>
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                    (=>
                      (Set_in x2@329@01 xs@316@01)
                      (and
                        (Set_in x2@329@01 xs@316@01)
                        (=>
                          (not (Set_in x2@329@01 ys@317@01))
                          (and
                            (not (Set_in x2@329@01 ys@317@01))
                            (=>
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (and
                                (not
                                  (=
                                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                    0))
                                (or
                                  (not
                                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))))
                            (or
                              (not
                                (=
                                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                  0))
                              (=
                                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                                0))))
                        (or
                          (not (Set_in x2@329@01 ys@317@01))
                          (Set_in x2@329@01 ys@317@01))))
                    (or
                      (Set_in x2@329@01 xs@316@01)
                      (not (Set_in x2@329@01 xs@316@01)))))
                (or
                  (not
                    (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))))
            (or
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))))
        (or (not (Set_in x1@328@01 ys@317@01)) (Set_in x1@328@01 ys@317@01))))
    (or (Set_in x1@328@01 xs@316@01) (not (Set_in x1@328@01 xs@316@01)))
    (=>
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (not (Set_in x1@328@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
        (Set_in x2@329@01 xs@316@01)
        (not (Set_in x2@329@01 ys@317@01))
        (not
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
            0))
        (not
          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
        (not (= x1@328@01 x2@329@01))))
    (or
      (not
        (and
          (Set_in x1@328@01 xs@316@01)
          (and
            (not (Set_in x1@328@01 ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                  0))
              (and
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
                (and
                  (Set_in x2@329@01 xs@316@01)
                  (and
                    (not (Set_in x2@329@01 ys@317@01))
                    (and
                      (not
                        (=
                          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                          0))
                      (and
                        (not
                          (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                        (not (= x1@328@01 x2@329@01)))))))))))
      (and
        (Set_in x1@328@01 xs@316@01)
        (and
          (not (Set_in x1@328@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
                0))
            (and
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
              (and
                (Set_in x2@329@01 xs@316@01)
                (and
                  (not (Set_in x2@329@01 ys@317@01))
                  (and
                    (not
                      (=
                        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                        0))
                    (and
                      (not
                        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                      (not (= x1@328@01 x2@329@01))))))))))))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92-aux|)))
(assert (forall ((x1@328@01 $Ref) (x2@329@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@328@01 xs@316@01)
      (and
        (not (Set_in x1@328@01 ys@317@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@328@01)
              0))
          (and
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01))
            (and
              (Set_in x2@329@01 xs@316@01)
              (and
                (not (Set_in x2@329@01 ys@317@01))
                (and
                  (not
                    (=
                      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@329@01)
                      0))
                  (and
                    (not
                      (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
                    (not (= x1@328@01 x2@329@01))))))))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01))))
  :pattern ((Set_in x1@328@01 xs@316@01) (Set_in x2@329@01 xs@316@01))
  :pattern ((Set_in x1@328@01 xs@316@01) (Set_in x2@329@01 ys@317@01))
  :pattern ((Set_in x1@328@01 xs@316@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  :pattern ((Set_in x1@328@01 ys@317@01) (Set_in x2@329@01 xs@316@01))
  :pattern ((Set_in x1@328@01 ys@317@01) (Set_in x2@329@01 ys@317@01))
  :pattern ((Set_in x1@328@01 ys@317@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01) (Set_in x2@329@01 xs@316@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01) (Set_in x2@329@01 ys@317@01))
  :pattern ((Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@328@01) xs@316@01) (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@329@01) xs@316@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/generalised_shape.vpr@119@7@121@92|)))
(declare-const x@330@01 $Ref)
(push) ; 3
; [eval] (x in xs) && (!((x in ys)) && (x.f != 0 && !((x.g in xs))))
; [eval] (x in xs)
(push) ; 4
; [then-branch: 63 | !(x@330@01 in xs@316@01) | live]
; [else-branch: 63 | x@330@01 in xs@316@01 | live]
(push) ; 5
; [then-branch: 63 | !(x@330@01 in xs@316@01)]
(assert (not (Set_in x@330@01 xs@316@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 63 | x@330@01 in xs@316@01]
(assert (Set_in x@330@01 xs@316@01))
; [eval] !((x in ys))
; [eval] (x in ys)
(push) ; 6
; [then-branch: 64 | x@330@01 in ys@317@01 | live]
; [else-branch: 64 | !(x@330@01 in ys@317@01) | live]
(push) ; 7
; [then-branch: 64 | x@330@01 in ys@317@01]
(assert (Set_in x@330@01 ys@317@01))
(pop) ; 7
(push) ; 7
; [else-branch: 64 | !(x@330@01 in ys@317@01)]
(assert (not (Set_in x@330@01 ys@317@01)))
; [eval] x.f != 0
(push) ; 8
(assert (not (and
  (img@324@01 x@330@01)
  (and
    (Set_in (inv@323@01 x@330@01) xs@316@01)
    (not (Set_in (inv@323@01 x@330@01) ys@317@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
; [then-branch: 65 | Lookup(f, First:($t@319@01), x@330@01) == 0 | live]
; [else-branch: 65 | Lookup(f, First:($t@319@01), x@330@01) != 0 | live]
(push) ; 9
; [then-branch: 65 | Lookup(f, First:($t@319@01), x@330@01) == 0]
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
  0))
(pop) ; 9
(push) ; 9
; [else-branch: 65 | Lookup(f, First:($t@319@01), x@330@01) != 0]
(assert (not
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
    0)))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(push) ; 10
(assert (not (and
  (img@327@01 x@330@01)
  (and
    (Set_in (inv@326@01 x@330@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x@330@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x@330@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
      0))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
    0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in x@330@01 ys@317@01))
  (and
    (not (Set_in x@330@01 ys@317@01))
    (or
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
          0))
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
        0)))))
(assert (or (not (Set_in x@330@01 ys@317@01)) (Set_in x@330@01 ys@317@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@330@01 xs@316@01)
  (and
    (Set_in x@330@01 xs@316@01)
    (=>
      (not (Set_in x@330@01 ys@317@01))
      (and
        (not (Set_in x@330@01 ys@317@01))
        (or
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
              0))
          (=
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
            0))))
    (or (not (Set_in x@330@01 ys@317@01)) (Set_in x@330@01 ys@317@01)))))
(assert (or (Set_in x@330@01 xs@316@01) (not (Set_in x@330@01 xs@316@01))))
(assert (and
  (Set_in x@330@01 xs@316@01)
  (and
    (not (Set_in x@330@01 ys@317@01))
    (and
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
          0))
      (not
        (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01) xs@316@01))))))
(push) ; 4
(assert (not (and
  (img@327@01 x@330@01)
  (and
    (Set_in (inv@326@01 x@330@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x@330@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x@330@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@331@01 ($Ref) $Ref)
(declare-fun img@332@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@330@01 $Ref)) (!
  (=>
    (and
      (Set_in x@330@01 xs@316@01)
      (and
        (not (Set_in x@330@01 ys@317@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01) xs@316@01)))))
    (and
      (=>
        (Set_in x@330@01 xs@316@01)
        (and
          (Set_in x@330@01 xs@316@01)
          (=>
            (not (Set_in x@330@01 ys@317@01))
            (and
              (not (Set_in x@330@01 ys@317@01))
              (or
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
                    0))
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
                  0))))
          (or (not (Set_in x@330@01 ys@317@01)) (Set_in x@330@01 ys@317@01))))
      (or (Set_in x@330@01 xs@316@01) (not (Set_in x@330@01 xs@316@01)))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@330@01 $Ref) (x2@330@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in x1@330@01 xs@316@01)
        (and
          (not (Set_in x1@330@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x1@330@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@330@01) xs@316@01)))))
      (and
        (Set_in x2@330@01 xs@316@01)
        (and
          (not (Set_in x2@330@01 ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x2@330@01)
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@330@01) xs@316@01)))))
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x1@330@01)
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x2@330@01)))
    (= x1@330@01 x2@330@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@330@01 $Ref)) (!
  (=>
    (and
      (Set_in x@330@01 xs@316@01)
      (and
        (not (Set_in x@330@01 ys@317@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01) xs@316@01)))))
    (and
      (=
        (inv@331@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01))
        x@330@01)
      (img@332@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01))))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01))
  :qid |quant-u-97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@332@01 r)
      (and
        (Set_in (inv@331@01 r) xs@316@01)
        (and
          (not (Set_in (inv@331@01 r) ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@331@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 r)) xs@316@01))))))
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 r))
      r))
  :pattern ((inv@331@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@330@01 $Ref)) (!
  (=>
    (and
      (Set_in x@330@01 xs@316@01)
      (and
        (not (Set_in x@330@01 ys@317@01))
        (and
          (not
            (=
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) x@330@01)
              0))
          (not
            (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01) xs@316@01)))))
    (not
      (=
        ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01)
        $Ref.null)))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@330@01)
      x@322@01)
    (=
      (and
        (img@332@01 r)
        (and
          (Set_in (inv@331@01 r) xs@316@01)
          (and
            (not (Set_in (inv@331@01 r) ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@331@01 r))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 r)) xs@316@01))))))
      (and
        (img@324@01 r)
        (and
          (Set_in (inv@323@01 r) xs@316@01)
          (not (Set_in (inv@323@01 r) ys@317@01))))))
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@319@01 xs@316@01 ys@317@01))
; [exec]
; inhale (x in xs)
(declare-const $t@333@01 $Snap)
(assert (= $t@333@01 $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@318@01 xs@316@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !((x in ys))
(declare-const $t@334@01 $Snap)
(assert (= $t@334@01 $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@318@01 ys@317@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != null
(declare-const $t@335@01 $Snap)
(assert (= $t@335@01 $Snap.unit))
; [eval] x != null
(assert (not (= x@318@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; a := x.f
(declare-const sm@336@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@324@01 r)
      (and
        (Set_in (inv@323@01 r) xs@316@01)
        (not (Set_in (inv@323@01 r) ys@317@01))))
    (=
      ($FVF.lookup_f (as sm@336@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) r)))
  :pattern (($FVF.lookup_f (as sm@336@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@332@01 r)
      (and
        (Set_in (inv@331@01 r) xs@316@01)
        (and
          (not (Set_in (inv@331@01 r) ys@317@01))
          (and
            (not
              (=
                ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@331@01 r))
                0))
            (not
              (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 r)) xs@316@01))))))
    (=
      ($FVF.lookup_f (as sm@336@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@319@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@336@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@319@01)))) r))
  :qid |qp.fvfValDef89|)))
(declare-const pm@337@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@337@01  $FPM) r)
    (+
      (ite
        (and
          (img@324@01 r)
          (and
            (Set_in (inv@323@01 r) xs@316@01)
            (not (Set_in (inv@323@01 r) ys@317@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@332@01 r)
          (and
            (Set_in (inv@331@01 r) xs@316@01)
            (and
              (not (Set_in (inv@331@01 r) ys@317@01))
              (and
                (not
                  (=
                    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@331@01 r))
                    0))
                (not
                  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 r)) xs@316@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@337@01  $FPM) r))
  :qid |qp.resPrmSumDef90|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@337@01  $FPM) x@318@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@338@01 Int)
(assert (= a@338@01 ($FVF.lookup_f (as sm@336@01  $FVF<f>) x@318@01)))
; [exec]
; inhale a != 0
(declare-const $t@339@01 $Snap)
(assert (= $t@339@01 $Snap.unit))
; [eval] a != 0
(assert (not (= a@338@01 0)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b := x.g
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@327@01 x@318@01)
  (and
    (Set_in (inv@326@01 x@318@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x@318@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x@318@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const b@340@01 $Ref)
(assert (=
  b@340@01
  ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)))
; [exec]
; inhale !((x.g in xs))
(declare-const $t@341@01 $Snap)
(assert (= $t@341@01 $Snap.unit))
; [eval] !((x.g in xs))
; [eval] (x.g in xs)
(push) ; 3
(assert (not (and
  (img@327@01 x@318@01)
  (and
    (Set_in (inv@326@01 x@318@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x@318@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x@318@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01) xs@316@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.g != null
(declare-const $t@342@01 $Snap)
(assert (= $t@342@01 $Snap.unit))
; [eval] x.g != null
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@327@01 x@318@01)
  (and
    (Set_in (inv@326@01 x@318@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x@318@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x@318@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)
    $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; a := x.g.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@327@01 x@318@01)
  (and
    (Set_in (inv@326@01 x@318@01) xs@316@01)
    (and
      (not (Set_in (inv@326@01 x@318@01) ys@317@01))
      (not
        (=
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@326@01 x@318@01))
          0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@324@01 r)
        (and
          (Set_in (inv@323@01 r) xs@316@01)
          (not (Set_in (inv@323@01 r) ys@317@01))))
      (=
        ($FVF.lookup_f (as sm@336@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) r)))
    :pattern (($FVF.lookup_f (as sm@336@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) r))
    :qid |qp.fvfValDef88|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@332@01 r)
        (and
          (Set_in (inv@331@01 r) xs@316@01)
          (and
            (not (Set_in (inv@331@01 r) ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@331@01 r))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 r)) xs@316@01))))))
      (=
        ($FVF.lookup_f (as sm@336@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@319@01)))) r)))
    :pattern (($FVF.lookup_f (as sm@336@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@319@01)))) r))
    :qid |qp.fvfValDef89|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@324@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01))
        (and
          (Set_in (inv@323@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)) xs@316@01)
          (not
            (Set_in (inv@323@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)) ys@317@01))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@332@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01))
        (and
          (Set_in (inv@331@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)) xs@316@01)
          (and
            (not
              (Set_in (inv@331@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)) ys@317@01))
            (and
              (not
                (=
                  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@319@01)) (inv@331@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01)))
                  0))
              (not
                (Set_in ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) (inv@331@01 ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01))) xs@316@01))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@343@01 Int)
(assert (=
  a@343@01
  ($FVF.lookup_f (as sm@336@01  $FVF<f>) ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.first ($Snap.second $t@319@01))) x@318@01))))
(pop) ; 2
(pop) ; 1
