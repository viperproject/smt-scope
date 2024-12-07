(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:16:46
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr
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
; /field_value_functions_declarations.smt2 [f: Ref]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) $Ref)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f ($Ref $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /field_value_functions_declarations.smt2 [g: Int]
(declare-fun $FVF.domain_g ($FVF<g>) Set<$Ref>)
(declare-fun $FVF.lookup_g ($FVF<g> $Ref) Int)
(declare-fun $FVF.after_g ($FVF<g> $FVF<g>) Bool)
(declare-fun $FVF.loc_g (Int $Ref) Bool)
(declare-fun $FVF.perm_g ($FPM $Ref) $Perm)
(declare-const $fvfTOP_g $FVF<g>)
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
; /field_value_functions_axioms.smt2 [f: Ref]
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
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
; /field_value_functions_axioms.smt2 [g: Int]
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
(assert (forall ((r $Ref) (f Int)) (!
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
; ---------- test03 ----------
(declare-const S@0@01 Set<$Ref>)
(declare-const S@1@01 Set<$Ref>)
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
; inhale (forall s: Ref ::(s in S) ==> acc(s.f, write))
(declare-const s@2@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@2@01 S@1@01))
(pop) ; 3
(declare-const $t@3@01 $FVF<f>)
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@2@01 $Ref) (s2@2@01 $Ref)) (!
  (=>
    (and (Set_in s1@2@01 S@1@01) (Set_in s2@2@01 S@1@01) (= s1@2@01 s2@2@01))
    (= s1@2@01 s2@2@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@2@01 $Ref)) (!
  (=>
    (Set_in s@2@01 S@1@01)
    (and (= (inv@4@01 s@2@01) s@2@01) (img@5@01 s@2@01)))
  :pattern ((Set_in s@2@01 S@1@01))
  :pattern ((inv@4@01 s@2@01))
  :pattern ((img@5@01 s@2@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Set_in (inv@4@01 r) S@1@01)) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@2@01 $Ref)) (!
  (=> (Set_in s@2@01 S@1@01) (not (= s@2@01 $Ref.null)))
  :pattern ((Set_in s@2@01 S@1@01))
  :pattern ((inv@4@01 s@2@01))
  :pattern ((img@5@01 s@2@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall s1: Ref, s2: Ref ::
;     { (s1 in S), (s2 in S) }
;     (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@7@01 $Ref)
(declare-const s2@8@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 4
; [then-branch: 0 | !(s1@7@01 in S@1@01) | live]
; [else-branch: 0 | s1@7@01 in S@1@01 | live]
(push) ; 5
; [then-branch: 0 | !(s1@7@01 in S@1@01)]
(assert (not (Set_in s1@7@01 S@1@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | s1@7@01 in S@1@01]
(assert (Set_in s1@7@01 S@1@01))
; [eval] (s2 in S)
(push) ; 6
; [then-branch: 1 | !(s2@8@01 in S@1@01) | live]
; [else-branch: 1 | s2@8@01 in S@1@01 | live]
(push) ; 7
; [then-branch: 1 | !(s2@8@01 in S@1@01)]
(assert (not (Set_in s2@8@01 S@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | s2@8@01 in S@1@01]
(assert (Set_in s2@8@01 S@1@01))
; [eval] s1 != s2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@8@01 S@1@01) (not (Set_in s2@8@01 S@1@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@7@01 S@1@01)
  (and
    (Set_in s1@7@01 S@1@01)
    (or (Set_in s2@8@01 S@1@01) (not (Set_in s2@8@01 S@1@01))))))
(assert (or (Set_in s1@7@01 S@1@01) (not (Set_in s1@7@01 S@1@01))))
(push) ; 4
; [then-branch: 2 | s1@7@01 in S@1@01 && s2@8@01 in S@1@01 && s1@7@01 != s2@8@01 | live]
; [else-branch: 2 | !(s1@7@01 in S@1@01 && s2@8@01 in S@1@01 && s1@7@01 != s2@8@01) | live]
(push) ; 5
; [then-branch: 2 | s1@7@01 in S@1@01 && s2@8@01 in S@1@01 && s1@7@01 != s2@8@01]
(assert (and
  (Set_in s1@7@01 S@1@01)
  (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01)))))
; [eval] s1.f != s2.f
(push) ; 6
(assert (not (and (img@5@01 s1@7@01) (Set_in (inv@4@01 s1@7@01) S@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and (img@5@01 s2@8@01) (Set_in (inv@4@01 s2@8@01) S@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(s1@7@01 in S@1@01 && s2@8@01 in S@1@01 && s1@7@01 != s2@8@01)]
(assert (not
  (and
    (Set_in s1@7@01 S@1@01)
    (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@7@01 S@1@01)
    (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01))))
  (and (Set_in s1@7@01 S@1@01) (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@7@01 S@1@01)
      (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01)))))
  (and
    (Set_in s1@7@01 S@1@01)
    (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@7@01 $Ref) (s2@8@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@7@01 S@1@01)
      (and
        (Set_in s1@7@01 S@1@01)
        (or (Set_in s2@8@01 S@1@01) (not (Set_in s2@8@01 S@1@01)))))
    (or (Set_in s1@7@01 S@1@01) (not (Set_in s1@7@01 S@1@01)))
    (=>
      (and
        (Set_in s1@7@01 S@1@01)
        (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01))))
      (and
        (Set_in s1@7@01 S@1@01)
        (Set_in s2@8@01 S@1@01)
        (not (= s1@7@01 s2@8@01))))
    (or
      (not
        (and
          (Set_in s1@7@01 S@1@01)
          (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01)))))
      (and
        (Set_in s1@7@01 S@1@01)
        (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01))))))
  :pattern ((Set_in s1@7@01 S@1@01) (Set_in s2@8@01 S@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@9@10@9@86-aux|)))
(assert (forall ((s1@7@01 $Ref) (s2@8@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@7@01 S@1@01)
      (and (Set_in s2@8@01 S@1@01) (not (= s1@7@01 s2@8@01))))
    (not (= ($FVF.lookup_f $t@3@01 s1@7@01) ($FVF.lookup_f $t@3@01 s2@8@01))))
  :pattern ((Set_in s1@7@01 S@1@01) (Set_in s2@8@01 S@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@9@10@9@86|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall s: Ref ::(s in S) ==> acc(s.f.g, write))
(declare-const s@9@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@9@01 S@1@01))
(push) ; 4
(assert (not (and (img@5@01 s@9@01) (Set_in (inv@4@01 s@9@01) S@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@10@01 $FVF<g>)
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@9@01 $Ref) (s2@9@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@9@01 S@1@01)
      (Set_in s2@9@01 S@1@01)
      (= ($FVF.lookup_f $t@3@01 s1@9@01) ($FVF.lookup_f $t@3@01 s2@9@01)))
    (= s1@9@01 s2@9@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@9@01 $Ref)) (!
  (=>
    (Set_in s@9@01 S@1@01)
    (and
      (= (inv@11@01 ($FVF.lookup_f $t@3@01 s@9@01)) s@9@01)
      (img@12@01 ($FVF.lookup_f $t@3@01 s@9@01))))
  :pattern (($FVF.lookup_f $t@3@01 s@9@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Set_in (inv@11@01 r) S@1@01))
    (= ($FVF.lookup_f $t@3@01 (inv@11@01 r)) r))
  :pattern ((inv@11@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@9@01 $Ref)) (!
  (=> (Set_in s@9@01 S@1@01) (not (= ($FVF.lookup_f $t@3@01 s@9@01) $Ref.null)))
  :pattern (($FVF.lookup_f $t@3@01 s@9@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall s: Ref ::(s in S) ==> acc(s.f.g, write))
(declare-const s@13@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@13@01 S@1@01))
(push) ; 4
(assert (not (and (img@5@01 s@13@01) (Set_in (inv@4@01 s@13@01) S@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@13@01 $Ref) (s2@13@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@13@01 S@1@01)
      (Set_in s2@13@01 S@1@01)
      (= ($FVF.lookup_f $t@3@01 s1@13@01) ($FVF.lookup_f $t@3@01 s2@13@01)))
    (= s1@13@01 s2@13@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@13@01 $Ref)) (!
  (=>
    (Set_in s@13@01 S@1@01)
    (and
      (= (inv@14@01 ($FVF.lookup_f $t@3@01 s@13@01)) s@13@01)
      (img@15@01 ($FVF.lookup_f $t@3@01 s@13@01))))
  :pattern (($FVF.lookup_f $t@3@01 s@13@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@15@01 r) (Set_in (inv@14@01 r) S@1@01))
    (= ($FVF.lookup_f $t@3@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |g-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@14@01 r) S@1@01)
      (img@15@01 r)
      (= r ($FVF.lookup_f $t@3@01 (inv@14@01 r))))
    ($Perm.min
      (ite
        (and (img@12@01 r) (Set_in (inv@11@01 r) S@1@01))
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
        (and (img@12@01 r) (Set_in (inv@11@01 r) S@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@16@01 r))
    $Perm.No)
  
  :qid |quant-u-6|))))
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
      (Set_in (inv@14@01 r) S@1@01)
      (img@15@01 r)
      (= r ($FVF.lookup_f $t@3@01 (inv@14@01 r))))
    (= (- $Perm.Write (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (Set_in (inv@11@01 r) S@1@01))
    (= ($FVF.lookup_g (as sm@17@01  $FVF<g>) r) ($FVF.lookup_g $t@10@01 r)))
  :pattern (($FVF.lookup_g (as sm@17@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g $t@10@01 r))
  :qid |qp.fvfValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
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
; var s1: Ref
(declare-const s1@18@01 $Ref)
; [exec]
; var s2: Ref
(declare-const s2@19@01 $Ref)
; [exec]
; var s3: Ref
(declare-const s3@20@01 $Ref)
; [exec]
; var S: Set[Ref]
(declare-const S@21@01 Set<$Ref>)
; [exec]
; s1 := new(f, g)
(declare-const s1@22@01 $Ref)
(assert (not (= s1@22@01 $Ref.null)))
(declare-const f@23@01 $Ref)
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01) f@23@01))
(declare-const g@25@01 Int)
(declare-const sm@26@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@26@01  $FVF<g>) s1@22@01) g@25@01))
(assert (not (= s1@22@01 s2@19@01)))
(assert (not (= s1@22@01 s3@20@01)))
(assert (not (= s1@22@01 s1@18@01)))
(assert (not (Set_in s1@22@01 S@21@01)))
; [exec]
; s2 := new(f, g)
(declare-const s2@27@01 $Ref)
(assert (not (= s2@27@01 $Ref.null)))
(declare-const f@28@01 $Ref)
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@29@01  $FVF<f>) s2@27@01) f@28@01))
(declare-const g@30@01 Int)
(declare-const sm@31@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@31@01  $FVF<g>) s2@27@01) g@30@01))
(assert (not (= s2@27@01 ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01))))
(assert (not (= s2@27@01 s1@22@01)))
(assert (not (= s2@27@01 s2@19@01)))
(assert (not (= s2@27@01 s3@20@01)))
(assert (not (Set_in s2@27@01 S@21@01)))
; [exec]
; s3 := new(f, g)
(declare-const s3@32@01 $Ref)
(assert (not (= s3@32@01 $Ref.null)))
(declare-const f@33@01 $Ref)
(declare-const sm@34@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@34@01  $FVF<f>) s3@32@01) f@33@01))
(declare-const g@35@01 Int)
(declare-const sm@36@01 $FVF<g>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_g (as sm@36@01  $FVF<g>) s3@32@01) g@35@01))
(assert (not (= s3@32@01 ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01))))
(assert (not (= s3@32@01 s2@27@01)))
(assert (not (= s3@32@01 s1@22@01)))
(assert (not (= s3@32@01 s3@20@01)))
(assert (not (= s3@32@01 ($FVF.lookup_f (as sm@29@01  $FVF<f>) s2@27@01))))
(assert (not (Set_in s3@32@01 S@21@01)))
; [exec]
; S := Set(s1, s2, s3)
; [eval] Set(s1, s2, s3)
(declare-const S@37@01 Set<$Ref>)
(assert (=
  S@37@01
  (Set_unionone (Set_unionone (Set_singleton s1@22@01) s2@27@01) s3@32@01)))
; [exec]
; assert (forall s: Ref ::(s in S) ==> acc(s.f, write))
(declare-const s@38@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@38@01 S@37@01))
(pop) ; 3
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@38@01 $Ref) (s2@38@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@38@01 S@37@01)
      (Set_in s2@38@01 S@37@01)
      (= s1@38@01 s2@38@01))
    (= s1@38@01 s2@38@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@38@01 $Ref)) (!
  (=>
    (Set_in s@38@01 S@37@01)
    (and (= (inv@39@01 s@38@01) s@38@01) (img@40@01 s@38@01)))
  :pattern ((Set_in s@38@01 S@37@01))
  :pattern ((inv@39@01 s@38@01))
  :pattern ((img@40@01 s@38@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@40@01 r) (Set_in (inv@39@01 r) S@37@01)) (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@39@01 r) S@37@01) (img@40@01 r) (= r (inv@39@01 r)))
    ($Perm.min (ite (= r s3@32@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@39@01 r) S@37@01) (img@40@01 r) (= r (inv@39@01 r)))
    ($Perm.min
      (ite (= r s2@27@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@41@01 r)))
    $Perm.No))
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@39@01 r) S@37@01) (img@40@01 r) (= r (inv@39@01 r)))
    ($Perm.min
      (ite (= r s1@22@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@41@01 r)) (pTaken@42@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@41@01 s3@32@01)) $Perm.No)))
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
    (and (Set_in (inv@39@01 r) S@37@01) (img@40@01 r) (= r (inv@39@01 r)))
    (= (- $Perm.Write (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@42@01 s2@27@01)) $Perm.No)))
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
    (and (Set_in (inv@39@01 r) S@37@01) (img@40@01 r) (= r (inv@39@01 r)))
    (= (- (- $Perm.Write (pTaken@41@01 r)) (pTaken@42@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@43@01 s1@22@01)) $Perm.No)))
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
    (and (Set_in (inv@39@01 r) S@37@01) (img@40@01 r) (= r (inv@39@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@41@01 r)) (pTaken@42@01 r)) (pTaken@43@01 r))
      $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@44@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r s3@32@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s2@27@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s1@22@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
; [exec]
; inhale s1.f != null && (s2.f != null && s3.f != null)
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(assert (= ($Snap.first $t@45@01) $Snap.unit))
; [eval] s1.f != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r s3@32@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r s2@27@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r s1@22@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= s1@22@01 s3@32@01) $Perm.Write $Perm.No)
      (ite (= s1@22@01 s2@27@01) $Perm.Write $Perm.No))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) s1@22@01) $Ref.null)))
(assert (=
  ($Snap.second $t@45@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@45@01))
    ($Snap.second ($Snap.second $t@45@01)))))
(assert (= ($Snap.first ($Snap.second $t@45@01)) $Snap.unit))
; [eval] s2.f != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r s3@32@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r s2@27@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r s1@22@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+ (ite (= s2@27@01 s3@32@01) $Perm.Write $Perm.No) $Perm.Write)
    (ite (= s2@27@01 s1@22@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) s2@27@01) $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@45@01)) $Snap.unit))
; [eval] s3.f != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r s3@32@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r s2@27@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r s1@22@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+ $Perm.Write (ite (= s3@32@01 s2@27@01) $Perm.Write $Perm.No))
    (ite (= s3@32@01 s1@22@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) s3@32@01) $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall s: Ref ::(s in S) ==> acc(s.f.g, write))
(declare-const s@46@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@46@01 S@37@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r s3@32@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r s2@27@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r s1@22@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= s@46@01 s3@32@01) $Perm.Write $Perm.No)
      (ite (= s@46@01 s2@27@01) $Perm.Write $Perm.No))
    (ite (= s@46@01 s1@22@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@47@01 ($Ref) $Ref)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r s3@32@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s2@27@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s1@22@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@46@01 $Ref) (s2@46@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@46@01 S@37@01)
      (Set_in s2@46@01 S@37@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) s1@46@01)
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) s2@46@01)))
    (= s1@46@01 s2@46@01))
  
  :qid |g-rcvrInj|))))
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
(assert (not (= s2@27@01 s1@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s2@27@01 s1@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s3@32@01 s2@27@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s3@32@01 s1@22@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s3@32@01 s2@27@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= s3@32@01 s1@22@01)))
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
    ($FVF.lookup_g (as sm@36@01  $FVF<g>) s3@32@01)
    ($FVF.lookup_g (as sm@31@01  $FVF<g>) s2@27@01)))))
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
    ($FVF.lookup_g (as sm@36@01  $FVF<g>) s3@32@01)
    ($FVF.lookup_g (as sm@26@01  $FVF<g>) s1@22@01)))))
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
    ($FVF.lookup_g (as sm@31@01  $FVF<g>) s2@27@01)
    ($FVF.lookup_g (as sm@36@01  $FVF<g>) s3@32@01)))))
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
    ($FVF.lookup_g (as sm@31@01  $FVF<g>) s2@27@01)
    ($FVF.lookup_g (as sm@26@01  $FVF<g>) s1@22@01)))))
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
    ($FVF.lookup_g (as sm@26@01  $FVF<g>) s1@22@01)
    ($FVF.lookup_g (as sm@36@01  $FVF<g>) s3@32@01)))))
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
    ($FVF.lookup_g (as sm@26@01  $FVF<g>) s1@22@01)
    ($FVF.lookup_g (as sm@31@01  $FVF<g>) s2@27@01)))))
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
    ($FVF.lookup_f (as sm@34@01  $FVF<f>) s3@32@01)
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) s2@27@01)))))
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
    ($FVF.lookup_f (as sm@34@01  $FVF<f>) s3@32@01)
    ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01)))))
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
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) s2@27@01)
    ($FVF.lookup_f (as sm@34@01  $FVF<f>) s3@32@01)))))
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
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) s2@27@01)
    ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01)))))
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
    ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01)
    ($FVF.lookup_f (as sm@34@01  $FVF<f>) s3@32@01)))))
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
    ($FVF.lookup_f (as sm@24@01  $FVF<f>) s1@22@01)
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) s2@27@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= s3@32@01 s2@27@01)) (not (= s3@32@01 s1@22@01)))
  (and (not (= s2@27@01 s3@32@01)) (not (= s2@27@01 s1@22@01)))
  (and (not (= s1@22@01 s3@32@01)) (not (= s1@22@01 s2@27@01)))))
; Definitional axioms for snapshot map values
(declare-const pm@49@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@49@01  $FPM) r)
    (+
      (+
        (ite (= r s3@32@01) $Perm.Write $Perm.No)
        (ite (= r s2@27@01) $Perm.Write $Perm.No))
      (ite (= r s1@22@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(assert (<= ($FVF.perm_f (as pm@49@01  $FPM) s3@32@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@49@01  $FPM) s2@27@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@49@01  $FPM) s1@22@01) $Perm.Write))
(declare-const sm@50@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r s3@32@01)
    (=
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@36@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@50@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@36@01  $FVF<g>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s2@27@01)
    (=
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@31@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@50@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@31@01  $FVF<g>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s1@22@01)
    (=
      ($FVF.lookup_g (as sm@50@01  $FVF<g>) r)
      ($FVF.lookup_g (as sm@26@01  $FVF<g>) r)))
  :pattern (($FVF.lookup_g (as sm@50@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g (as sm@26@01  $FVF<g>) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@51@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_g (as pm@51@01  $FPM) r)
    (+
      (+
        (ite (= r s3@32@01) $Perm.Write $Perm.No)
        (ite (= r s2@27@01) $Perm.Write $Perm.No))
      (ite (= r s1@22@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_g (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (<= ($FVF.perm_g (as pm@51@01  $FPM) s3@32@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@51@01  $FPM) s2@27@01) $Perm.Write))
(assert (<= ($FVF.perm_g (as pm@51@01  $FPM) s1@22@01) $Perm.Write))
(declare-const s@52@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@52@01 S@37@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r s3@32@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r s2@27@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r s1@22@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= s@52@01 s3@32@01) $Perm.Write $Perm.No)
      (ite (= s@52@01 s2@27@01) $Perm.Write $Perm.No))
    (ite (= s@52@01 s1@22@01) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r s3@32@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s2@27@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r s1@22@01)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@52@01 $Ref) (s2@52@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@52@01 S@37@01)
      (Set_in s2@52@01 S@37@01)
      (=
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) s1@52@01)
        ($FVF.lookup_f (as sm@44@01  $FVF<f>) s2@52@01)))
    (= s1@52@01 s2@52@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const S@55@01 Set<$Ref>)
(declare-const S@56@01 Set<$Ref>)
(push) ; 1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 ($Snap.combine ($Snap.first $t@57@01) ($Snap.second $t@57@01))))
(declare-const s@58@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@58@01 S@56@01))
(pop) ; 2
(declare-fun inv@59@01 ($Ref) $Ref)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@58@01 $Ref) (s2@58@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@58@01 S@56@01)
      (Set_in s2@58@01 S@56@01)
      (= s1@58@01 s2@58@01))
    (= s1@58@01 s2@58@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@58@01 $Ref)) (!
  (=>
    (Set_in s@58@01 S@56@01)
    (and (= (inv@59@01 s@58@01) s@58@01) (img@60@01 s@58@01)))
  :pattern ((Set_in s@58@01 S@56@01))
  :pattern ((inv@59@01 s@58@01))
  :pattern ((img@60@01 s@58@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@60@01 r) (Set_in (inv@59@01 r) S@56@01)) (= (inv@59@01 r) r))
  :pattern ((inv@59@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@58@01 $Ref)) (!
  (=> (Set_in s@58@01 S@56@01) (not (= s@58@01 $Ref.null)))
  :pattern ((Set_in s@58@01 S@56@01))
  :pattern ((inv@59@01 s@58@01))
  :pattern ((img@60@01 s@58@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@57@01))
    ($Snap.second ($Snap.second $t@57@01)))))
(assert (= ($Snap.first ($Snap.second $t@57@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@61@01 $Ref)
(declare-const s2@62@01 $Ref)
(push) ; 2
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 3
; [then-branch: 3 | !(s1@61@01 in S@56@01) | live]
; [else-branch: 3 | s1@61@01 in S@56@01 | live]
(push) ; 4
; [then-branch: 3 | !(s1@61@01 in S@56@01)]
(assert (not (Set_in s1@61@01 S@56@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | s1@61@01 in S@56@01]
(assert (Set_in s1@61@01 S@56@01))
; [eval] (s2 in S)
(push) ; 5
; [then-branch: 4 | !(s2@62@01 in S@56@01) | live]
; [else-branch: 4 | s2@62@01 in S@56@01 | live]
(push) ; 6
; [then-branch: 4 | !(s2@62@01 in S@56@01)]
(assert (not (Set_in s2@62@01 S@56@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | s2@62@01 in S@56@01]
(assert (Set_in s2@62@01 S@56@01))
; [eval] s1 != s2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@62@01 S@56@01) (not (Set_in s2@62@01 S@56@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@61@01 S@56@01)
  (and
    (Set_in s1@61@01 S@56@01)
    (or (Set_in s2@62@01 S@56@01) (not (Set_in s2@62@01 S@56@01))))))
(assert (or (Set_in s1@61@01 S@56@01) (not (Set_in s1@61@01 S@56@01))))
(push) ; 3
; [then-branch: 5 | s1@61@01 in S@56@01 && s2@62@01 in S@56@01 && s1@61@01 != s2@62@01 | live]
; [else-branch: 5 | !(s1@61@01 in S@56@01 && s2@62@01 in S@56@01 && s1@61@01 != s2@62@01) | live]
(push) ; 4
; [then-branch: 5 | s1@61@01 in S@56@01 && s2@62@01 in S@56@01 && s1@61@01 != s2@62@01]
(assert (and
  (Set_in s1@61@01 S@56@01)
  (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01)))))
; [eval] s1.f != s2.f
(push) ; 5
(assert (not (and (img@60@01 s1@61@01) (Set_in (inv@59@01 s1@61@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and (img@60@01 s2@62@01) (Set_in (inv@59@01 s2@62@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(s1@61@01 in S@56@01 && s2@62@01 in S@56@01 && s1@61@01 != s2@62@01)]
(assert (not
  (and
    (Set_in s1@61@01 S@56@01)
    (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@61@01 S@56@01)
    (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01))))
  (and
    (Set_in s1@61@01 S@56@01)
    (Set_in s2@62@01 S@56@01)
    (not (= s1@61@01 s2@62@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@61@01 S@56@01)
      (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01)))))
  (and
    (Set_in s1@61@01 S@56@01)
    (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@61@01 S@56@01)
      (and
        (Set_in s1@61@01 S@56@01)
        (or (Set_in s2@62@01 S@56@01) (not (Set_in s2@62@01 S@56@01)))))
    (or (Set_in s1@61@01 S@56@01) (not (Set_in s1@61@01 S@56@01)))
    (=>
      (and
        (Set_in s1@61@01 S@56@01)
        (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01))))
      (and
        (Set_in s1@61@01 S@56@01)
        (Set_in s2@62@01 S@56@01)
        (not (= s1@61@01 s2@62@01))))
    (or
      (not
        (and
          (Set_in s1@61@01 S@56@01)
          (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01)))))
      (and
        (Set_in s1@61@01 S@56@01)
        (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01))))))
  :pattern ((Set_in s1@61@01 S@56@01) (Set_in s2@62@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@32@12@32@88-aux|)))
(assert (forall ((s1@61@01 $Ref) (s2@62@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@61@01 S@56@01)
      (and (Set_in s2@62@01 S@56@01) (not (= s1@61@01 s2@62@01))))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s1@61@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s2@62@01))))
  :pattern ((Set_in s1@61@01 S@56@01) (Set_in s2@62@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@32@12@32@88|)))
(declare-const s@63@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@63@01 S@56@01))
(push) ; 3
(assert (not (and (img@60@01 s@63@01) (Set_in (inv@59@01 s@63@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@64@01 ($Ref) $Ref)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@63@01 $Ref) (s2@63@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@63@01 S@56@01)
      (Set_in s2@63@01 S@56@01)
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s1@63@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s2@63@01)))
    (= s1@63@01 s2@63@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@63@01 $Ref)) (!
  (=>
    (Set_in s@63@01 S@56@01)
    (and
      (=
        (inv@64@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s@63@01))
        s@63@01)
      (img@65@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s@63@01))))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s@63@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@65@01 r) (Set_in (inv@64@01 r) S@56@01))
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) (inv@64@01 r))
      r))
  :pattern ((inv@64@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@63@01 $Ref)) (!
  (=>
    (Set_in s@63@01 S@56@01)
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s@63@01)
        $Ref.null)))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s@63@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(declare-const s@67@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@67@01 S@56@01))
(pop) ; 3
(declare-fun inv@68@01 ($Ref) $Ref)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@67@01 $Ref) (s2@67@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@67@01 S@56@01)
      (Set_in s2@67@01 S@56@01)
      (= s1@67@01 s2@67@01))
    (= s1@67@01 s2@67@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@67@01 $Ref)) (!
  (=>
    (Set_in s@67@01 S@56@01)
    (and (= (inv@68@01 s@67@01) s@67@01) (img@69@01 s@67@01)))
  :pattern ((Set_in s@67@01 S@56@01))
  :pattern ((inv@68@01 s@67@01))
  :pattern ((img@69@01 s@67@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@69@01 r) (Set_in (inv@68@01 r) S@56@01)) (= (inv@68@01 r) r))
  :pattern ((inv@68@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@67@01 $Ref)) (!
  (=> (Set_in s@67@01 S@56@01) (not (= s@67@01 $Ref.null)))
  :pattern ((Set_in s@67@01 S@56@01))
  :pattern ((inv@68@01 s@67@01))
  :pattern ((img@69@01 s@67@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@66@01))
    ($Snap.second ($Snap.second $t@66@01)))))
(assert (= ($Snap.first ($Snap.second $t@66@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@70@01 $Ref)
(declare-const s2@71@01 $Ref)
(push) ; 3
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 4
; [then-branch: 6 | !(s1@70@01 in S@56@01) | live]
; [else-branch: 6 | s1@70@01 in S@56@01 | live]
(push) ; 5
; [then-branch: 6 | !(s1@70@01 in S@56@01)]
(assert (not (Set_in s1@70@01 S@56@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | s1@70@01 in S@56@01]
(assert (Set_in s1@70@01 S@56@01))
; [eval] (s2 in S)
(push) ; 6
; [then-branch: 7 | !(s2@71@01 in S@56@01) | live]
; [else-branch: 7 | s2@71@01 in S@56@01 | live]
(push) ; 7
; [then-branch: 7 | !(s2@71@01 in S@56@01)]
(assert (not (Set_in s2@71@01 S@56@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | s2@71@01 in S@56@01]
(assert (Set_in s2@71@01 S@56@01))
; [eval] s1 != s2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@71@01 S@56@01) (not (Set_in s2@71@01 S@56@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@70@01 S@56@01)
  (and
    (Set_in s1@70@01 S@56@01)
    (or (Set_in s2@71@01 S@56@01) (not (Set_in s2@71@01 S@56@01))))))
(assert (or (Set_in s1@70@01 S@56@01) (not (Set_in s1@70@01 S@56@01))))
(push) ; 4
; [then-branch: 8 | s1@70@01 in S@56@01 && s2@71@01 in S@56@01 && s1@70@01 != s2@71@01 | live]
; [else-branch: 8 | !(s1@70@01 in S@56@01 && s2@71@01 in S@56@01 && s1@70@01 != s2@71@01) | live]
(push) ; 5
; [then-branch: 8 | s1@70@01 in S@56@01 && s2@71@01 in S@56@01 && s1@70@01 != s2@71@01]
(assert (and
  (Set_in s1@70@01 S@56@01)
  (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01)))))
; [eval] s1.f != s2.f
(push) ; 6
(assert (not (and (img@69@01 s1@70@01) (Set_in (inv@68@01 s1@70@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and (img@69@01 s2@71@01) (Set_in (inv@68@01 s2@71@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(s1@70@01 in S@56@01 && s2@71@01 in S@56@01 && s1@70@01 != s2@71@01)]
(assert (not
  (and
    (Set_in s1@70@01 S@56@01)
    (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@70@01 S@56@01)
    (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01))))
  (and
    (Set_in s1@70@01 S@56@01)
    (Set_in s2@71@01 S@56@01)
    (not (= s1@70@01 s2@71@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@70@01 S@56@01)
      (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01)))))
  (and
    (Set_in s1@70@01 S@56@01)
    (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@70@01 $Ref) (s2@71@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@70@01 S@56@01)
      (and
        (Set_in s1@70@01 S@56@01)
        (or (Set_in s2@71@01 S@56@01) (not (Set_in s2@71@01 S@56@01)))))
    (or (Set_in s1@70@01 S@56@01) (not (Set_in s1@70@01 S@56@01)))
    (=>
      (and
        (Set_in s1@70@01 S@56@01)
        (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01))))
      (and
        (Set_in s1@70@01 S@56@01)
        (Set_in s2@71@01 S@56@01)
        (not (= s1@70@01 s2@71@01))))
    (or
      (not
        (and
          (Set_in s1@70@01 S@56@01)
          (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01)))))
      (and
        (Set_in s1@70@01 S@56@01)
        (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01))))))
  :pattern ((Set_in s1@70@01 S@56@01) (Set_in s2@71@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@35@11@35@87-aux|)))
(assert (forall ((s1@70@01 $Ref) (s2@71@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@70@01 S@56@01)
      (and (Set_in s2@71@01 S@56@01) (not (= s1@70@01 s2@71@01))))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s1@70@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s2@71@01))))
  :pattern ((Set_in s1@70@01 S@56@01) (Set_in s2@71@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@35@11@35@87|)))
(declare-const s@72@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@72@01 S@56@01))
(push) ; 4
(assert (not (and (img@69@01 s@72@01) (Set_in (inv@68@01 s@72@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@73@01 ($Ref) $Ref)
(declare-fun img@74@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@72@01 $Ref) (s2@72@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@72@01 S@56@01)
      (Set_in s2@72@01 S@56@01)
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s1@72@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s2@72@01)))
    (= s1@72@01 s2@72@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@72@01 $Ref)) (!
  (=>
    (Set_in s@72@01 S@56@01)
    (and
      (=
        (inv@73@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s@72@01))
        s@72@01)
      (img@74@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s@72@01))))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s@72@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@74@01 r) (Set_in (inv@73@01 r) S@56@01))
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) (inv@73@01 r))
      r))
  :pattern ((inv@73@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@72@01 $Ref)) (!
  (=>
    (Set_in s@72@01 S@56@01)
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s@72@01)
        $Ref.null)))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@66@01)) s@72@01))
  :qid |g-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const s@75@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@75@01 S@56@01))
(pop) ; 3
(declare-fun inv@76@01 ($Ref) $Ref)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@75@01 $Ref) (s2@75@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@75@01 S@56@01)
      (Set_in s2@75@01 S@56@01)
      (= s1@75@01 s2@75@01))
    (= s1@75@01 s2@75@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@75@01 $Ref)) (!
  (=>
    (Set_in s@75@01 S@56@01)
    (and (= (inv@76@01 s@75@01) s@75@01) (img@77@01 s@75@01)))
  :pattern ((Set_in s@75@01 S@56@01))
  :pattern ((inv@76@01 s@75@01))
  :pattern ((img@77@01 s@75@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@77@01 r) (Set_in (inv@76@01 r) S@56@01)) (= (inv@76@01 r) r))
  :pattern ((inv@76@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@76@01 r) S@56@01) (img@77@01 r) (= r (inv@76@01 r)))
    ($Perm.min
      (ite
        (and (img@60@01 r) (Set_in (inv@59@01 r) S@56@01))
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
        (and (img@60@01 r) (Set_in (inv@59@01 r) S@56@01))
        $Perm.Write
        $Perm.No)
      (pTaken@78@01 r))
    $Perm.No)
  
  :qid |quant-u-28|))))
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
    (and (Set_in (inv@76@01 r) S@56@01) (img@77@01 r) (= r (inv@76@01 r)))
    (= (- $Perm.Write (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@60@01 r) (Set_in (inv@59@01 r) S@56@01))
    (=
      ($FVF.lookup_f (as sm@79@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r)))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) r))
  :qid |qp.fvfValDef9|)))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@80@01 $Ref)
(declare-const s2@81@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 4
; [then-branch: 9 | !(s1@80@01 in S@56@01) | live]
; [else-branch: 9 | s1@80@01 in S@56@01 | live]
(push) ; 5
; [then-branch: 9 | !(s1@80@01 in S@56@01)]
(assert (not (Set_in s1@80@01 S@56@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | s1@80@01 in S@56@01]
(assert (Set_in s1@80@01 S@56@01))
; [eval] (s2 in S)
(push) ; 6
; [then-branch: 10 | !(s2@81@01 in S@56@01) | live]
; [else-branch: 10 | s2@81@01 in S@56@01 | live]
(push) ; 7
; [then-branch: 10 | !(s2@81@01 in S@56@01)]
(assert (not (Set_in s2@81@01 S@56@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | s2@81@01 in S@56@01]
(assert (Set_in s2@81@01 S@56@01))
; [eval] s1 != s2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@81@01 S@56@01) (not (Set_in s2@81@01 S@56@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@80@01 S@56@01)
  (and
    (Set_in s1@80@01 S@56@01)
    (or (Set_in s2@81@01 S@56@01) (not (Set_in s2@81@01 S@56@01))))))
(assert (or (Set_in s1@80@01 S@56@01) (not (Set_in s1@80@01 S@56@01))))
(push) ; 4
; [then-branch: 11 | s1@80@01 in S@56@01 && s2@81@01 in S@56@01 && s1@80@01 != s2@81@01 | live]
; [else-branch: 11 | !(s1@80@01 in S@56@01 && s2@81@01 in S@56@01 && s1@80@01 != s2@81@01) | live]
(push) ; 5
; [then-branch: 11 | s1@80@01 in S@56@01 && s2@81@01 in S@56@01 && s1@80@01 != s2@81@01]
(assert (and
  (Set_in s1@80@01 S@56@01)
  (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01)))))
; [eval] s1.f != s2.f
(push) ; 6
(assert (not (and (img@60@01 s1@80@01) (Set_in (inv@59@01 s1@80@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and (img@60@01 s2@81@01) (Set_in (inv@59@01 s2@81@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(s1@80@01 in S@56@01 && s2@81@01 in S@56@01 && s1@80@01 != s2@81@01)]
(assert (not
  (and
    (Set_in s1@80@01 S@56@01)
    (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@80@01 S@56@01)
    (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))
  (and
    (Set_in s1@80@01 S@56@01)
    (Set_in s2@81@01 S@56@01)
    (not (= s1@80@01 s2@81@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@80@01 S@56@01)
      (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01)))))
  (and
    (Set_in s1@80@01 S@56@01)
    (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@80@01 $Ref) (s2@81@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@80@01 S@56@01)
      (and
        (Set_in s1@80@01 S@56@01)
        (or (Set_in s2@81@01 S@56@01) (not (Set_in s2@81@01 S@56@01)))))
    (or (Set_in s1@80@01 S@56@01) (not (Set_in s1@80@01 S@56@01)))
    (=>
      (and
        (Set_in s1@80@01 S@56@01)
        (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))
      (and
        (Set_in s1@80@01 S@56@01)
        (Set_in s2@81@01 S@56@01)
        (not (= s1@80@01 s2@81@01))))
    (or
      (not
        (and
          (Set_in s1@80@01 S@56@01)
          (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01)))))
      (and
        (Set_in s1@80@01 S@56@01)
        (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))))
  :pattern ((Set_in s1@80@01 S@56@01) (Set_in s2@81@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@35@11@35@87-aux|)))
(push) ; 3
(assert (not (forall ((s1@80@01 $Ref) (s2@81@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@80@01 S@56@01)
      (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))
    (not
      (=
        ($FVF.lookup_f (as sm@79@01  $FVF<f>) s1@80@01)
        ($FVF.lookup_f (as sm@79@01  $FVF<f>) s2@81@01))))
  :pattern ((Set_in s1@80@01 S@56@01) (Set_in s2@81@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@35@11@35@87|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((s1@80@01 $Ref) (s2@81@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@80@01 S@56@01)
      (and (Set_in s2@81@01 S@56@01) (not (= s1@80@01 s2@81@01))))
    (not
      (=
        ($FVF.lookup_f (as sm@79@01  $FVF<f>) s1@80@01)
        ($FVF.lookup_f (as sm@79@01  $FVF<f>) s2@81@01))))
  :pattern ((Set_in s1@80@01 S@56@01) (Set_in s2@81@01 S@56@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@35@11@35@87|)))
(declare-const s@82@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@82@01 S@56@01))
(push) ; 4
(assert (not (and (img@60@01 s@82@01) (Set_in (inv@59@01 s@82@01) S@56@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@83@01 ($Ref) $Ref)
(declare-fun img@84@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@82@01 $Ref) (s2@82@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@82@01 S@56@01)
      (Set_in s2@82@01 S@56@01)
      (=
        ($FVF.lookup_f (as sm@79@01  $FVF<f>) s1@82@01)
        ($FVF.lookup_f (as sm@79@01  $FVF<f>) s2@82@01)))
    (= s1@82@01 s2@82@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@82@01 $Ref)) (!
  (=>
    (Set_in s@82@01 S@56@01)
    (and
      (= (inv@83@01 ($FVF.lookup_f (as sm@79@01  $FVF<f>) s@82@01)) s@82@01)
      (img@84@01 ($FVF.lookup_f (as sm@79@01  $FVF<f>) s@82@01))))
  :pattern (($FVF.lookup_f (as sm@79@01  $FVF<f>) s@82@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) S@56@01))
    (= ($FVF.lookup_f (as sm@79@01  $FVF<f>) (inv@83@01 r)) r))
  :pattern ((inv@83@01 r))
  :qid |g-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((s@82@01 $Ref)) (!
  (=
    ($FVF.lookup_f (as sm@79@01  $FVF<f>) s@82@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@57@01)) s@82@01))
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@85@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@83@01 r) S@56@01)
      (img@84@01 r)
      (= r ($FVF.lookup_f (as sm@79@01  $FVF<f>) (inv@83@01 r))))
    ($Perm.min
      (ite
        (and (img@65@01 r) (Set_in (inv@64@01 r) S@56@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@65@01 r) (Set_in (inv@64@01 r) S@56@01))
        $Perm.Write
        $Perm.No)
      (pTaken@85@01 r))
    $Perm.No)
  
  :qid |quant-u-33|))))
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
      (Set_in (inv@83@01 r) S@56@01)
      (img@84@01 r)
      (= r ($FVF.lookup_f (as sm@79@01  $FVF<f>) (inv@83@01 r))))
    (= (- $Perm.Write (pTaken@85@01 r)) $Perm.No))
  
  :qid |quant-u-34|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@86@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@65@01 r) (Set_in (inv@64@01 r) S@56@01))
    (=
      ($FVF.lookup_g (as sm@86@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@57@01))) r)))
  :pattern (($FVF.lookup_g (as sm@86@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@57@01))) r))
  :qid |qp.fvfValDef10|)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const S@87@01 Set<$Ref>)
(declare-const S@88@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 ($Snap.combine ($Snap.first $t@89@01) ($Snap.second $t@89@01))))
(declare-const s@90@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@90@01 S@88@01))
(pop) ; 2
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@90@01 $Ref) (s2@90@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@90@01 S@88@01)
      (Set_in s2@90@01 S@88@01)
      (= s1@90@01 s2@90@01))
    (= s1@90@01 s2@90@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@90@01 $Ref)) (!
  (=>
    (Set_in s@90@01 S@88@01)
    (and (= (inv@91@01 s@90@01) s@90@01) (img@92@01 s@90@01)))
  :pattern ((Set_in s@90@01 S@88@01))
  :pattern ((inv@91@01 s@90@01))
  :pattern ((img@92@01 s@90@01))
  :qid |quant-u-36|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) S@88@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@90@01 $Ref)) (!
  (=> (Set_in s@90@01 S@88@01) (not (= s@90@01 $Ref.null)))
  :pattern ((Set_in s@90@01 S@88@01))
  :pattern ((inv@91@01 s@90@01))
  :pattern ((img@92@01 s@90@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@89@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@89@01))
    ($Snap.second ($Snap.second $t@89@01)))))
(assert (= ($Snap.first ($Snap.second $t@89@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@93@01 $Ref)
(declare-const s2@94@01 $Ref)
(push) ; 2
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 3
; [then-branch: 12 | !(s1@93@01 in S@88@01) | live]
; [else-branch: 12 | s1@93@01 in S@88@01 | live]
(push) ; 4
; [then-branch: 12 | !(s1@93@01 in S@88@01)]
(assert (not (Set_in s1@93@01 S@88@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | s1@93@01 in S@88@01]
(assert (Set_in s1@93@01 S@88@01))
; [eval] (s2 in S)
(push) ; 5
; [then-branch: 13 | !(s2@94@01 in S@88@01) | live]
; [else-branch: 13 | s2@94@01 in S@88@01 | live]
(push) ; 6
; [then-branch: 13 | !(s2@94@01 in S@88@01)]
(assert (not (Set_in s2@94@01 S@88@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | s2@94@01 in S@88@01]
(assert (Set_in s2@94@01 S@88@01))
; [eval] s1 != s2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@94@01 S@88@01) (not (Set_in s2@94@01 S@88@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@93@01 S@88@01)
  (and
    (Set_in s1@93@01 S@88@01)
    (or (Set_in s2@94@01 S@88@01) (not (Set_in s2@94@01 S@88@01))))))
(assert (or (Set_in s1@93@01 S@88@01) (not (Set_in s1@93@01 S@88@01))))
(push) ; 3
; [then-branch: 14 | s1@93@01 in S@88@01 && s2@94@01 in S@88@01 && s1@93@01 != s2@94@01 | live]
; [else-branch: 14 | !(s1@93@01 in S@88@01 && s2@94@01 in S@88@01 && s1@93@01 != s2@94@01) | live]
(push) ; 4
; [then-branch: 14 | s1@93@01 in S@88@01 && s2@94@01 in S@88@01 && s1@93@01 != s2@94@01]
(assert (and
  (Set_in s1@93@01 S@88@01)
  (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01)))))
; [eval] s1.f != s2.f
(push) ; 5
(assert (not (and (img@92@01 s1@93@01) (Set_in (inv@91@01 s1@93@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and (img@92@01 s2@94@01) (Set_in (inv@91@01 s2@94@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(s1@93@01 in S@88@01 && s2@94@01 in S@88@01 && s1@93@01 != s2@94@01)]
(assert (not
  (and
    (Set_in s1@93@01 S@88@01)
    (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@93@01 S@88@01)
    (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01))))
  (and
    (Set_in s1@93@01 S@88@01)
    (Set_in s2@94@01 S@88@01)
    (not (= s1@93@01 s2@94@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@93@01 S@88@01)
      (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01)))))
  (and
    (Set_in s1@93@01 S@88@01)
    (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@93@01 $Ref) (s2@94@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@93@01 S@88@01)
      (and
        (Set_in s1@93@01 S@88@01)
        (or (Set_in s2@94@01 S@88@01) (not (Set_in s2@94@01 S@88@01)))))
    (or (Set_in s1@93@01 S@88@01) (not (Set_in s1@93@01 S@88@01)))
    (=>
      (and
        (Set_in s1@93@01 S@88@01)
        (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01))))
      (and
        (Set_in s1@93@01 S@88@01)
        (Set_in s2@94@01 S@88@01)
        (not (= s1@93@01 s2@94@01))))
    (or
      (not
        (and
          (Set_in s1@93@01 S@88@01)
          (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01)))))
      (and
        (Set_in s1@93@01 S@88@01)
        (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01))))))
  :pattern ((Set_in s1@93@01 S@88@01) (Set_in s2@94@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@41@12@41@88-aux|)))
(assert (forall ((s1@93@01 $Ref) (s2@94@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@93@01 S@88@01)
      (and (Set_in s2@94@01 S@88@01) (not (= s1@93@01 s2@94@01))))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s1@93@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s2@94@01))))
  :pattern ((Set_in s1@93@01 S@88@01) (Set_in s2@94@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@41@12@41@88|)))
(declare-const s@95@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@95@01 S@88@01))
(push) ; 3
(assert (not (and (img@92@01 s@95@01) (Set_in (inv@91@01 s@95@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@96@01 ($Ref) $Ref)
(declare-fun img@97@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@95@01 $Ref) (s2@95@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@95@01 S@88@01)
      (Set_in s2@95@01 S@88@01)
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s1@95@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s2@95@01)))
    (= s1@95@01 s2@95@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@95@01 $Ref)) (!
  (=>
    (Set_in s@95@01 S@88@01)
    (and
      (=
        (inv@96@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s@95@01))
        s@95@01)
      (img@97@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s@95@01))))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s@95@01))
  :qid |quant-u-38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (Set_in (inv@96@01 r) S@88@01))
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) (inv@96@01 r))
      r))
  :pattern ((inv@96@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@95@01 $Ref)) (!
  (=>
    (Set_in s@95@01 S@88@01)
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s@95@01)
        $Ref.null)))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s@95@01))
  :qid |g-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 ($Snap.combine ($Snap.first $t@98@01) ($Snap.second $t@98@01))))
(declare-const s@99@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@99@01 S@88@01))
(pop) ; 3
(declare-fun inv@100@01 ($Ref) $Ref)
(declare-fun img@101@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@99@01 $Ref) (s2@99@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@99@01 S@88@01)
      (Set_in s2@99@01 S@88@01)
      (= s1@99@01 s2@99@01))
    (= s1@99@01 s2@99@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@99@01 $Ref)) (!
  (=>
    (Set_in s@99@01 S@88@01)
    (and (= (inv@100@01 s@99@01) s@99@01) (img@101@01 s@99@01)))
  :pattern ((Set_in s@99@01 S@88@01))
  :pattern ((inv@100@01 s@99@01))
  :pattern ((img@101@01 s@99@01))
  :qid |quant-u-40|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@101@01 r) (Set_in (inv@100@01 r) S@88@01)) (= (inv@100@01 r) r))
  :pattern ((inv@100@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@99@01 $Ref)) (!
  (=> (Set_in s@99@01 S@88@01) (not (= s@99@01 $Ref.null)))
  :pattern ((Set_in s@99@01 S@88@01))
  :pattern ((inv@100@01 s@99@01))
  :pattern ((img@101@01 s@99@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@98@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@98@01))
    ($Snap.second ($Snap.second $t@98@01)))))
(assert (= ($Snap.first ($Snap.second $t@98@01)) $Snap.unit))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@102@01 $Ref)
(declare-const s2@103@01 $Ref)
(push) ; 3
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 4
; [then-branch: 15 | !(s1@102@01 in S@88@01) | live]
; [else-branch: 15 | s1@102@01 in S@88@01 | live]
(push) ; 5
; [then-branch: 15 | !(s1@102@01 in S@88@01)]
(assert (not (Set_in s1@102@01 S@88@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | s1@102@01 in S@88@01]
(assert (Set_in s1@102@01 S@88@01))
; [eval] (s2 in S)
(push) ; 6
; [then-branch: 16 | !(s2@103@01 in S@88@01) | live]
; [else-branch: 16 | s2@103@01 in S@88@01 | live]
(push) ; 7
; [then-branch: 16 | !(s2@103@01 in S@88@01)]
(assert (not (Set_in s2@103@01 S@88@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | s2@103@01 in S@88@01]
(assert (Set_in s2@103@01 S@88@01))
; [eval] s1 != s2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@103@01 S@88@01) (not (Set_in s2@103@01 S@88@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@102@01 S@88@01)
  (and
    (Set_in s1@102@01 S@88@01)
    (or (Set_in s2@103@01 S@88@01) (not (Set_in s2@103@01 S@88@01))))))
(assert (or (Set_in s1@102@01 S@88@01) (not (Set_in s1@102@01 S@88@01))))
(push) ; 4
; [then-branch: 17 | s1@102@01 in S@88@01 && s2@103@01 in S@88@01 && s1@102@01 != s2@103@01 | live]
; [else-branch: 17 | !(s1@102@01 in S@88@01 && s2@103@01 in S@88@01 && s1@102@01 != s2@103@01) | live]
(push) ; 5
; [then-branch: 17 | s1@102@01 in S@88@01 && s2@103@01 in S@88@01 && s1@102@01 != s2@103@01]
(assert (and
  (Set_in s1@102@01 S@88@01)
  (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01)))))
; [eval] s1.f != s2.f
(push) ; 6
(assert (not (and (img@101@01 s1@102@01) (Set_in (inv@100@01 s1@102@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and (img@101@01 s2@103@01) (Set_in (inv@100@01 s2@103@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(s1@102@01 in S@88@01 && s2@103@01 in S@88@01 && s1@102@01 != s2@103@01)]
(assert (not
  (and
    (Set_in s1@102@01 S@88@01)
    (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@102@01 S@88@01)
    (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01))))
  (and
    (Set_in s1@102@01 S@88@01)
    (Set_in s2@103@01 S@88@01)
    (not (= s1@102@01 s2@103@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@102@01 S@88@01)
      (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01)))))
  (and
    (Set_in s1@102@01 S@88@01)
    (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@102@01 $Ref) (s2@103@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@102@01 S@88@01)
      (and
        (Set_in s1@102@01 S@88@01)
        (or (Set_in s2@103@01 S@88@01) (not (Set_in s2@103@01 S@88@01)))))
    (or (Set_in s1@102@01 S@88@01) (not (Set_in s1@102@01 S@88@01)))
    (=>
      (and
        (Set_in s1@102@01 S@88@01)
        (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01))))
      (and
        (Set_in s1@102@01 S@88@01)
        (Set_in s2@103@01 S@88@01)
        (not (= s1@102@01 s2@103@01))))
    (or
      (not
        (and
          (Set_in s1@102@01 S@88@01)
          (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01)))))
      (and
        (Set_in s1@102@01 S@88@01)
        (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01))))))
  :pattern ((Set_in s1@102@01 S@88@01) (Set_in s2@103@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@44@11@44@87-aux|)))
(assert (forall ((s1@102@01 $Ref) (s2@103@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@102@01 S@88@01)
      (and (Set_in s2@103@01 S@88@01) (not (= s1@102@01 s2@103@01))))
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s1@102@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s2@103@01))))
  :pattern ((Set_in s1@102@01 S@88@01) (Set_in s2@103@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@44@11@44@87|)))
(declare-const s@104@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@104@01 S@88@01))
(push) ; 4
(assert (not (and (img@101@01 s@104@01) (Set_in (inv@100@01 s@104@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@105@01 ($Ref) $Ref)
(declare-fun img@106@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@104@01 $Ref) (s2@104@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@104@01 S@88@01)
      (Set_in s2@104@01 S@88@01)
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s1@104@01)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s2@104@01)))
    (= s1@104@01 s2@104@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@104@01 $Ref)) (!
  (=>
    (Set_in s@104@01 S@88@01)
    (and
      (=
        (inv@105@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s@104@01))
        s@104@01)
      (img@106@01 ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s@104@01))))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s@104@01))
  :qid |quant-u-42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@106@01 r) (Set_in (inv@105@01 r) S@88@01))
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) (inv@105@01 r))
      r))
  :pattern ((inv@105@01 r))
  :qid |g-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@104@01 $Ref)) (!
  (=>
    (Set_in s@104@01 S@88@01)
    (not
      (=
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s@104@01)
        $Ref.null)))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@98@01)) s@104@01))
  :qid |g-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const s@107@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@107@01 S@88@01))
(pop) ; 3
(declare-fun inv@108@01 ($Ref) $Ref)
(declare-fun img@109@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@107@01 $Ref) (s2@107@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@107@01 S@88@01)
      (Set_in s2@107@01 S@88@01)
      (= s1@107@01 s2@107@01))
    (= s1@107@01 s2@107@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@107@01 $Ref)) (!
  (=>
    (Set_in s@107@01 S@88@01)
    (and (= (inv@108@01 s@107@01) s@107@01) (img@109@01 s@107@01)))
  :pattern ((Set_in s@107@01 S@88@01))
  :pattern ((inv@108@01 s@107@01))
  :pattern ((img@109@01 s@107@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@109@01 r) (Set_in (inv@108@01 r) S@88@01)) (= (inv@108@01 r) r))
  :pattern ((inv@108@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@110@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@108@01 r) S@88@01) (img@109@01 r) (= r (inv@108@01 r)))
    ($Perm.min
      (ite
        (and (img@92@01 r) (Set_in (inv@91@01 r) S@88@01))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@92@01 r) (Set_in (inv@91@01 r) S@88@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@110@01 r))
    $Perm.No)
  
  :qid |quant-u-45|))))
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
    (and (Set_in (inv@108@01 r) S@88@01) (img@109@01 r) (= r (inv@108@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@110@01 r)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@111@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@01 r) (Set_in (inv@91@01 r) S@88@01))
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) r))
  :qid |qp.fvfValDef11|)))
; [eval] (forall s1: Ref, s2: Ref :: { (s1 in S), (s2 in S) } (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f)
(declare-const s1@112@01 $Ref)
(declare-const s2@113@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (s1 in S) && ((s2 in S) && s1 != s2) ==> s1.f != s2.f
; [eval] (s1 in S) && ((s2 in S) && s1 != s2)
; [eval] (s1 in S)
(push) ; 4
; [then-branch: 18 | !(s1@112@01 in S@88@01) | live]
; [else-branch: 18 | s1@112@01 in S@88@01 | live]
(push) ; 5
; [then-branch: 18 | !(s1@112@01 in S@88@01)]
(assert (not (Set_in s1@112@01 S@88@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | s1@112@01 in S@88@01]
(assert (Set_in s1@112@01 S@88@01))
; [eval] (s2 in S)
(push) ; 6
; [then-branch: 19 | !(s2@113@01 in S@88@01) | live]
; [else-branch: 19 | s2@113@01 in S@88@01 | live]
(push) ; 7
; [then-branch: 19 | !(s2@113@01 in S@88@01)]
(assert (not (Set_in s2@113@01 S@88@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | s2@113@01 in S@88@01]
(assert (Set_in s2@113@01 S@88@01))
; [eval] s1 != s2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in s2@113@01 S@88@01) (not (Set_in s2@113@01 S@88@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in s1@112@01 S@88@01)
  (and
    (Set_in s1@112@01 S@88@01)
    (or (Set_in s2@113@01 S@88@01) (not (Set_in s2@113@01 S@88@01))))))
(assert (or (Set_in s1@112@01 S@88@01) (not (Set_in s1@112@01 S@88@01))))
(push) ; 4
; [then-branch: 20 | s1@112@01 in S@88@01 && s2@113@01 in S@88@01 && s1@112@01 != s2@113@01 | live]
; [else-branch: 20 | !(s1@112@01 in S@88@01 && s2@113@01 in S@88@01 && s1@112@01 != s2@113@01) | live]
(push) ; 5
; [then-branch: 20 | s1@112@01 in S@88@01 && s2@113@01 in S@88@01 && s1@112@01 != s2@113@01]
(assert (and
  (Set_in s1@112@01 S@88@01)
  (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01)))))
; [eval] s1.f != s2.f
(push) ; 6
(assert (not (and (img@92@01 s1@112@01) (Set_in (inv@91@01 s1@112@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and (img@92@01 s2@113@01) (Set_in (inv@91@01 s2@113@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(s1@112@01 in S@88@01 && s2@113@01 in S@88@01 && s1@112@01 != s2@113@01)]
(assert (not
  (and
    (Set_in s1@112@01 S@88@01)
    (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in s1@112@01 S@88@01)
    (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))
  (and
    (Set_in s1@112@01 S@88@01)
    (Set_in s2@113@01 S@88@01)
    (not (= s1@112@01 s2@113@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in s1@112@01 S@88@01)
      (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01)))))
  (and
    (Set_in s1@112@01 S@88@01)
    (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s1@112@01 $Ref) (s2@113@01 $Ref)) (!
  (and
    (=>
      (Set_in s1@112@01 S@88@01)
      (and
        (Set_in s1@112@01 S@88@01)
        (or (Set_in s2@113@01 S@88@01) (not (Set_in s2@113@01 S@88@01)))))
    (or (Set_in s1@112@01 S@88@01) (not (Set_in s1@112@01 S@88@01)))
    (=>
      (and
        (Set_in s1@112@01 S@88@01)
        (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))
      (and
        (Set_in s1@112@01 S@88@01)
        (Set_in s2@113@01 S@88@01)
        (not (= s1@112@01 s2@113@01))))
    (or
      (not
        (and
          (Set_in s1@112@01 S@88@01)
          (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01)))))
      (and
        (Set_in s1@112@01 S@88@01)
        (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))))
  :pattern ((Set_in s1@112@01 S@88@01) (Set_in s2@113@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@44@11@44@87-aux|)))
(push) ; 3
(assert (not (forall ((s1@112@01 $Ref) (s2@113@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@112@01 S@88@01)
      (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))
    (not
      (=
        ($FVF.lookup_f (as sm@111@01  $FVF<f>) s1@112@01)
        ($FVF.lookup_f (as sm@111@01  $FVF<f>) s2@113@01))))
  :pattern ((Set_in s1@112@01 S@88@01) (Set_in s2@113@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@44@11@44@87|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((s1@112@01 $Ref) (s2@113@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@112@01 S@88@01)
      (and (Set_in s2@113@01 S@88@01) (not (= s1@112@01 s2@113@01))))
    (not
      (=
        ($FVF.lookup_f (as sm@111@01  $FVF<f>) s1@112@01)
        ($FVF.lookup_f (as sm@111@01  $FVF<f>) s2@113@01))))
  :pattern ((Set_in s1@112@01 S@88@01) (Set_in s2@113@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0066.vpr@44@11@44@87|)))
(declare-const s@114@01 $Ref)
(push) ; 3
; [eval] (s in S)
(assert (Set_in s@114@01 S@88@01))
(push) ; 4
(assert (not (and (img@92@01 s@114@01) (Set_in (inv@91@01 s@114@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@115@01 ($Ref) $Ref)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((s1@114@01 $Ref) (s2@114@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@114@01 S@88@01)
      (Set_in s2@114@01 S@88@01)
      (=
        ($FVF.lookup_f (as sm@111@01  $FVF<f>) s1@114@01)
        ($FVF.lookup_f (as sm@111@01  $FVF<f>) s2@114@01)))
    (= s1@114@01 s2@114@01))
  
  :qid |g-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@114@01 $Ref)) (!
  (=>
    (Set_in s@114@01 S@88@01)
    (and
      (= (inv@115@01 ($FVF.lookup_f (as sm@111@01  $FVF<f>) s@114@01)) s@114@01)
      (img@116@01 ($FVF.lookup_f (as sm@111@01  $FVF<f>) s@114@01))))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) s@114@01))
  :qid |g-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (Set_in (inv@115@01 r) S@88@01))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) (inv@115@01 r)) r))
  :pattern ((inv@115@01 r))
  :qid |g-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((s@114@01 $Ref)) (!
  (=
    ($FVF.lookup_f (as sm@111@01  $FVF<f>) s@114@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@89@01)) s@114@01))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@115@01 r) S@88@01)
      (img@116@01 r)
      (= r ($FVF.lookup_f (as sm@111@01  $FVF<f>) (inv@115@01 r))))
    ($Perm.min
      (ite
        (and (img@97@01 r) (Set_in (inv@96@01 r) S@88@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@97@01 r) (Set_in (inv@96@01 r) S@88@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@117@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
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
      (Set_in (inv@115@01 r) S@88@01)
      (img@116@01 r)
      (= r ($FVF.lookup_f (as sm@111@01  $FVF<f>) (inv@115@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@117@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@118@01 $FVF<g>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (Set_in (inv@96@01 r) S@88@01))
    (=
      ($FVF.lookup_g (as sm@118@01  $FVF<g>) r)
      ($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@89@01))) r)))
  :pattern (($FVF.lookup_g (as sm@118@01  $FVF<g>) r))
  :pattern (($FVF.lookup_g ($SortWrappers.$SnapTo$FVF<g> ($Snap.second ($Snap.second $t@89@01))) r))
  :qid |qp.fvfValDef12|)))
(pop) ; 2
(pop) ; 1
